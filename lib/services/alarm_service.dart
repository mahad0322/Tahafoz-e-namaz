import 'dart:async';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/services.dart';
import 'package:drift/drift.dart';
import 'package:tahafoz_e_namaz/features/prayers/data/local/database.dart';
import 'package:tahafoz_e_namaz/services/notification_service.dart';

const MethodChannel _dndChannel = MethodChannel('tahafooz/dnd');

// Interruption filter constants (match Android NotificationManager values)
const int interruptionFilterAll = 1; // allow all
const int interruptionFilterNone = 3; // no interruptions (full DND)

/// Helper to compute deterministic alarm ids for a prayer and type.
int _alarmIdFor(String prayerKey, String type) {
  final base = prayerKey.hashCode & 0x7fffffff;
  return base * 10 + (type == 'start' ? 1 : 2);
}

/// Top-level callback invoked by android_alarm_manager_plus when an alarm fires.
@pragma('vm:entry-point')
Future<void> alarmCallback(int id,
    {AppDatabase? database, int? testWeekday}) async {
  // Open DB, find scheduled alarm by id. Accept optional injected database for testing.
  final db = database ?? AppDatabase();
  final shouldCloseDb = database == null;
  try {
    final rows = await (db.select(db.scheduledAlarms)
          ..where((t) => t.id.equals(id)))
        .get();
    if (rows.isEmpty) return;
    final row = rows.first;
    final prayerKey = row.prayerKey;
    final alarmType = row.alarmType; // 'start' or 'end'

    final now = DateTime.now().millisecondsSinceEpoch;

    if (alarmType == 'start') {
      // Friday/Jummah logic: determine whether this alarm should trigger DND
      if (!_shouldTriggerForPrayer(prayerKey, testWeekday)) {
        return;
      }
      // push DND state
      await db.into(db.dndScheduleStates).insert(DndScheduleStatesCompanion(
            prayerKey: Value(prayerKey),
            startedAt: Value(now),
            expiresAt: Value(row.scheduledAt +
                1000 * 60), // placeholder, actual duration handled elsewhere
            pushedAt: Value(now),
            isActive: Value(true),
          ));

      // Enable DND (set to none)
      try {
        await _dndChannel.invokeMethod(
            'setInterruptionFilter', {'filter': interruptionFilterNone});
      } catch (e) {
        // ignore errors calling native DND toggle
      }

      // show persistent DND notification
      try {
        await NotificationService().showDndActive(prayerKey);
      } catch (_) {}

      // Reschedule end alarm if not present (end id)
      final endId = _alarmIdFor(prayerKey, 'end');
      final existingEnd = await (db.select(db.scheduledAlarms)
            ..where((t) => t.id.equals(endId)))
          .get();
      if (existingEnd.isEmpty) {
        // compute expiresAt from prayers table
        final pRows = await (db.select(db.prayers)
              ..where((t) => t.key.equals(prayerKey)))
            .get();
        if (pRows.isNotEmpty) {
          final duration = pRows.first.durationMinutes;
          final endTime = DateTime.now()
              .add(Duration(minutes: duration))
              .millisecondsSinceEpoch;
          await db.into(db.scheduledAlarms).insert(ScheduledAlarmsCompanion(
                id: Value(endId),
                prayerKey: Value(prayerKey),
                alarmType: Value('end'),
                scheduledAt: Value(endTime),
              ));
          try {
            await AndroidAlarmManager.oneShotAt(
                DateTime.fromMillisecondsSinceEpoch(endTime),
                endId,
                alarmCallback,
                exact: true,
                wakeup: true);
          } catch (e) {
            // ignore errors scheduling native alarm (tests or unsupported platform)
          }
        }
      }
    } else if (alarmType == 'end') {
      // Attempt to pop only if top matches this prayerKey
      final top = await (db.select(db.dndScheduleStates)
            ..orderBy([
              (t) =>
                  OrderingTerm(expression: t.pushedAt, mode: OrderingMode.desc)
            ])
            ..limit(1))
          .get();
      if (top.isNotEmpty && top.first.prayerKey == prayerKey) {
        await (db.delete(db.dndScheduleStates)
              ..where((t) => t.id.equals(top.first.id)))
            .go();

        // Check new top
        final newTop = await (db.select(db.dndScheduleStates)
              ..orderBy([
                (t) => OrderingTerm(
                    expression: t.pushedAt, mode: OrderingMode.desc)
              ])
              ..limit(1))
            .get();
        if (newTop.isEmpty) {
          // disable DND
          try {
            await _dndChannel.invokeMethod(
                'setInterruptionFilter', {'filter': interruptionFilterAll});
          } catch (e) {
            // ignore
          }
          try {
            await NotificationService().cancelDnd();
          } catch (_) {}
        } else {
          // keep DND enabled for the top's desired state (keep none)
          try {
            await _dndChannel.invokeMethod(
                'setInterruptionFilter', {'filter': interruptionFilterNone});
          } catch (e) {
            // ignore
          }
        }
      }
      // remove scheduled end entry
      await (db.delete(db.scheduledAlarms)..where((t) => t.id.equals(id))).go();
    }
  } finally {
    if (shouldCloseDb) await db.close();
  }
}

/// Returns whether the alarm for [prayerKey] should trigger DND based on weekday.
bool _shouldTriggerForPrayer(String prayerKey, [int? weekday]) {
  final wd = weekday ?? DateTime.now().weekday;
  const friday = 5; // DateTime.weekday: Monday=1 ... Sunday=7
  if (prayerKey == 'zuhr' && wd == friday) return false;
  if (prayerKey == 'jummah' && wd != friday) return false;
  return true;
}

class AlarmService {
  final AppDatabase db;
  AlarmService(this.db);

  Future<void> init() async {
    await AndroidAlarmManager.initialize();
  }

  Future<void> schedulePrayerAlarms(String prayerKey) async {
    final pRows = await (db.select(db.prayers)
          ..where((t) => t.key.equals(prayerKey)))
        .get();
    if (pRows.isEmpty) return;
    final p = pRows.first;
    final now = DateTime.now();
    final target = DateTime(now.year, now.month, now.day)
        .add(Duration(minutes: p.timeMinutes));
    final scheduled =
        target.isBefore(now) ? target.add(const Duration(days: 1)) : target;

    final startId = _alarmIdFor(prayerKey, 'start');

    // persist start mapping
    await db
        .into(db.scheduledAlarms)
        .insertOnConflictUpdate(ScheduledAlarmsCompanion(
          id: Value(startId),
          prayerKey: Value(prayerKey),
          alarmType: Value('start'),
          scheduledAt: Value(scheduled.millisecondsSinceEpoch),
        ));

    try {
      await AndroidAlarmManager.oneShotAt(scheduled, startId, alarmCallback,
          exact: true, wakeup: true);
    } catch (e) {
      // ignore errors on platforms where android alarm manager isn't available
    }
  }

  /// Schedule alarms for all enabled prayers in the DB.
  Future<void> scheduleAllEnabledPrayers() async {
    final all = await (db.select(db.prayers)
          ..where((t) => t.enabled.equals(true)))
        .get();
    for (final p in all) {
      await schedulePrayerAlarms(p.key);
    }
  }

  Future<void> cancelAlarmsForPrayer(String prayerKey) async {
    final rows = await (db.select(db.scheduledAlarms)
          ..where((t) => t.prayerKey.equals(prayerKey)))
        .get();
    for (final r in rows) {
      try {
        await AndroidAlarmManager.cancel(r.id);
      } catch (e) {
        // ignore
      }
      await (db.delete(db.scheduledAlarms)..where((t) => t.id.equals(r.id)))
          .go();
    }
  }
}
