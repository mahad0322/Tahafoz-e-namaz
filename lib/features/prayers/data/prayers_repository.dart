import 'package:drift/drift.dart';
import 'package:tahafoz_e_namaz/features/prayers/data/local/database.dart';
import 'package:tahafoz_e_namaz/services/alarm_service.dart';

class PrayersRepository {
  final AppDatabase db;
  final AlarmService alarmService;

  PrayersRepository(this.db, this.alarmService);

  Future<void> savePrayer(PrayersCompanion companion) async {
    // Insert or update by key
    final key = companion.key.value;
    final existing = await (db.select(db.prayers)..where((t) => t.key.equals(key))).get();
    final now = DateTime.now().millisecondsSinceEpoch;
    if (existing.isEmpty) {
      await db.into(db.prayers).insert(companion.copyWith(createdAt: Value(now), updatedAt: Value(now)));
    } else {
      final row = existing.first;
      await (db.update(db.prayers)..where((t) => t.id.equals(row.id))).write(PrayersCompanion(
        key: companion.key,
        displayName: companion.displayName,
        timeMinutes: companion.timeMinutes,
        durationMinutes: companion.durationMinutes,
        enabled: companion.enabled,
        updatedAt: Value(now),
      ));
    }

    // Reschedule alarms for this prayer
    await alarmService.schedulePrayerAlarms(key);
  }
}
