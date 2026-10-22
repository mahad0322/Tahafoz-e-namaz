import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Prayers, DndScheduleStates, AppSettings, ScheduledAlarms])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await _seedDefaultPrayers();
        },
        onUpgrade: (m, from, to) async {
          // Future migrations should be implemented here as incremental steps.
          if (from < 2) {
            // example: await m.addColumn(prayers, prayers.someNewColumn);
          }
        },
      );

  Future<void> _seedDefaultPrayers() async {
    final now = DateTime.now().millisecondsSinceEpoch;
    final defaultRows = [
      {
        'key': 'fajr',
        'display_name': 'Fajr',
        'time_minutes': 300, // 05:00
        'duration_minutes': 15,
      },
      {
        'key': 'zuhr',
        'display_name': 'Zuhr',
        'time_minutes': 12 * 60 + 30, // 12:30
        'duration_minutes': 15,
      },
      {
        'key': 'asr',
        'display_name': 'Asr',
        'time_minutes': 15 * 60, // 15:00
        'duration_minutes': 15,
      },
      {
        'key': 'maghrib',
        'display_name': 'Maghrib',
        'time_minutes': 18 * 60 + 15, // 18:15
        'duration_minutes': 15,
      },
      {
        'key': 'isha',
        'display_name': 'Isha',
        'time_minutes': 20 * 60, // 20:00
        'duration_minutes': 15,
      },
      {
        'key': 'jummah',
        'display_name': 'Jummah',
        'time_minutes': 12 * 60 + 15, // 12:15 (user-editable)
        'duration_minutes': 30,
      },
    ];

    for (final row in defaultRows) {
      await into(prayers).insert(PrayersCompanion.insert(
        key: row['key'] as String,
        displayName: row['display_name'] as String,
        timeMinutes: row['time_minutes'] as int,
        durationMinutes: row['duration_minutes'] as int,
        createdAt: now,
        updatedAt: now,
      ));
    }
    await into(appSettings).insert(const AppSettingsCompanion());
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final docs = await getApplicationDocumentsDirectory();
    final dbFolder = Directory(p.join(docs.path, 'databases'));
    await dbFolder.create(recursive: true);
    final file = File(p.join(dbFolder.path, 'tahafooz.db'));
    return NativeDatabase(file);
  });
}
