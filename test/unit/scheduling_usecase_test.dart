import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tahafoz_e_namaz/features/prayers/data/local/database.dart';
import 'package:tahafoz_e_namaz/services/alarm_service.dart';

void main() {
  test('DND filter constants match Android NotificationManager values', () {
    expect(interruptionFilterAll, 1);
    expect(interruptionFilterNone, 3);
  });

  group('Friday/Jummah logic', () {
    test('zuhr suppressed on Friday', () async {
      final db = AppDatabase(NativeDatabase.memory());
      try {
        // seed a zuhr scheduled alarm with id 1
        await db.into(db.scheduledAlarms).insert(ScheduledAlarmsCompanion(
              id: Value(1),
              prayerKey: Value('zuhr'),
              alarmType: Value('start'),
              scheduledAt: Value(DateTime.now().millisecondsSinceEpoch),
            ));

        // call alarmCallback with testWeekday = Friday (5)
        await alarmCallback(1, database: db, testWeekday: 5);

        final states = await db.select(db.dndScheduleStates).get();
        expect(states, isEmpty);
      } finally {
        await db.close();
      }
    });

    test('jummah triggers on Friday', () async {
      final db = AppDatabase(NativeDatabase.memory());
      try {
        await db.into(db.scheduledAlarms).insert(ScheduledAlarmsCompanion(
              id: Value(2),
              prayerKey: Value('jummah'),
              alarmType: Value('start'),
              scheduledAt: Value(DateTime.now().millisecondsSinceEpoch),
            ));

        await alarmCallback(2, database: db, testWeekday: 5);

        final states = await db.select(db.dndScheduleStates).get();
        expect(states, isNotEmpty);
        expect(states.first.prayerKey, 'jummah');
      } finally {
        await db.close();
      }
    });
  });

  group('Overlapping DND stack', () {
    test('older end does not disable newer top', () async {
      final db = AppDatabase(NativeDatabase.memory());
      try {
        final now = DateTime.now().millisecondsSinceEpoch;
        // push two active states: older fajr, newer asr
        await db.into(db.dndScheduleStates).insert(DndScheduleStatesCompanion(
              prayerKey: Value('fajr'),
              startedAt: Value(now - 100000),
              expiresAt: Value(now + 100000),
              pushedAt: Value(now - 100000),
              isActive: Value(true),
            ));
        await db.into(db.dndScheduleStates).insert(DndScheduleStatesCompanion(
              prayerKey: Value('asr'),
              startedAt: Value(now - 1000),
              expiresAt: Value(now + 200000),
              pushedAt: Value(now - 1000),
              isActive: Value(true),
            ));

        // create scheduled end alarm for older fajr with id 10
        await db.into(db.scheduledAlarms).insert(ScheduledAlarmsCompanion(
              id: Value(10),
              prayerKey: Value('fajr'),
              alarmType: Value('end'),
              scheduledAt: Value(now),
            ));

        // firing end for fajr should NOT pop asr (top)
        await alarmCallback(10, database: db);
        final states = await db.select(db.dndScheduleStates).get();
        expect(states, isNotEmpty);
        expect(states.any((s) => s.prayerKey == 'asr'), isTrue);
      } finally {
        await db.close();
      }
    });

    test('end matching top pops and clears DND', () async {
      final db = AppDatabase(NativeDatabase.memory());
      try {
        final now = DateTime.now().millisecondsSinceEpoch;
        // push a single state for maghrib
        await db.into(db.dndScheduleStates).insert(DndScheduleStatesCompanion(
              prayerKey: Value('maghrib'),
              startedAt: Value(now - 1000),
              expiresAt: Value(now + 100000),
              pushedAt: Value(now - 1000),
              isActive: Value(true),
            ));

        await db.into(db.scheduledAlarms).insert(ScheduledAlarmsCompanion(
              id: Value(11),
              prayerKey: Value('maghrib'),
              alarmType: Value('end'),
              scheduledAt: Value(now),
            ));

        await alarmCallback(11, database: db);
        final states = await db.select(db.dndScheduleStates).get();
        expect(states, isEmpty);
      } finally {
        await db.close();
      }
    });
  });
}
