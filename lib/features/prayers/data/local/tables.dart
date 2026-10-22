import 'package:drift/drift.dart';

class Prayers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get key => text().withLength(min: 1, max: 50)();
  TextColumn get displayName => text().named('display_name')();
  IntColumn get timeMinutes => integer().named('time_minutes')();
  IntColumn get durationMinutes => integer().named('duration_minutes')();
  BoolColumn get enabled => boolean().withDefault(const Constant(true))();
  IntColumn get createdAt => integer().named('created_at')();
  IntColumn get updatedAt => integer().named('updated_at')();
  @override
  List<Set<Column>> get uniqueKeys => [ {key} ];
}

class DndScheduleStates extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get prayerKey => text().named('prayer_key')();
  IntColumn get startedAt => integer().named('started_at')();
  IntColumn get expiresAt => integer().named('expires_at')();
  IntColumn get pushedAt => integer().named('pushed_at')();
  BoolColumn get isActive => boolean().named('is_active').withDefault(const Constant(true))();
}

class AppSettings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get defaultDurationMinutes => integer().named('default_duration_minutes').withDefault(const Constant(15))();
  IntColumn get lastMigration => integer().named('last_migration').withDefault(const Constant(1))();
  IntColumn get timezoneOffsetMinutes => integer().named('timezone_offset_minutes').nullable()();
}

class ScheduledAlarms extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get prayerKey => text().named('prayer_key')();
  TextColumn get alarmType => text().named('alarm_type')(); // 'start' or 'end'
  IntColumn get scheduledAt => integer().named('scheduled_at')(); // epoch millis
}
