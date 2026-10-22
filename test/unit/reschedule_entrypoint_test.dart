import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tahafoz_e_namaz/features/prayers/data/local/database.dart';
import 'package:tahafoz_e_namaz/services/alarm_service.dart';

void main() {
  test('schedules enabled prayers into scheduledAlarms', () async {
    final db = AppDatabase(NativeDatabase.memory());
    try {
      // seed prayers table with two enabled and one disabled
      final now = DateTime.now().millisecondsSinceEpoch;
      await db.into(db.prayers).insert(PrayersCompanion(
        key: Value('p1'),
        displayName: Value('P1'),
        timeMinutes: Value(600),
        durationMinutes: Value(15),
        enabled: Value(true),
        createdAt: Value(now),
        updatedAt: Value(now),
      ));
      await db.into(db.prayers).insert(PrayersCompanion(
        key: Value('p2'),
        displayName: Value('P2'),
        timeMinutes: Value(700),
        durationMinutes: Value(15),
        enabled: Value(true),
        createdAt: Value(now),
        updatedAt: Value(now),
      ));
      await db.into(db.prayers).insert(PrayersCompanion(
        key: Value('p3'),
        displayName: Value('P3'),
        timeMinutes: Value(800),
        durationMinutes: Value(15),
        enabled: Value(false),
        createdAt: Value(now),
        updatedAt: Value(now),
      ));

      final alarmService = AlarmService(db);
      await alarmService.scheduleAllEnabledPrayers();

      final scheduled = await db.select(db.scheduledAlarms).get();
      // debug
      for (final s in scheduled) {
        print('scheduled: id=${s.id} key=${s.prayerKey} type=${s.alarmType} at=${s.scheduledAt}');
      }
      expect(scheduled.length >= 2, isTrue);
      final keys = scheduled.map((s) => s.prayerKey).toSet();
      expect(keys.contains('p1'), isTrue);
      expect(keys.contains('p2'), isTrue);
      expect(keys.contains('p3'), isFalse);
    } finally {
      await db.close();
    }
  });
}
