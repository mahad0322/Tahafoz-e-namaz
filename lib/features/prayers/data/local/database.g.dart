// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PrayersTable extends Prayers with TableInfo<$PrayersTable, Prayer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrayersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeMinutesMeta =
      const VerificationMeta('timeMinutes');
  @override
  late final GeneratedColumn<int> timeMinutes = GeneratedColumn<int>(
      'time_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _durationMinutesMeta =
      const VerificationMeta('durationMinutes');
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
      'duration_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _enabledMeta =
      const VerificationMeta('enabled');
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
      'enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("enabled" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        key,
        displayName,
        timeMinutes,
        durationMinutes,
        enabled,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prayers';
  @override
  VerificationContext validateIntegrity(Insertable<Prayer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('time_minutes')) {
      context.handle(
          _timeMinutesMeta,
          timeMinutes.isAcceptableOrUnknown(
              data['time_minutes']!, _timeMinutesMeta));
    } else if (isInserting) {
      context.missing(_timeMinutesMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
          _durationMinutesMeta,
          durationMinutes.isAcceptableOrUnknown(
              data['duration_minutes']!, _durationMinutesMeta));
    } else if (isInserting) {
      context.missing(_durationMinutesMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(_enabledMeta,
          enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {key},
      ];
  @override
  Prayer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Prayer(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name'])!,
      timeMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time_minutes'])!,
      durationMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_minutes'])!,
      enabled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}enabled'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $PrayersTable createAlias(String alias) {
    return $PrayersTable(attachedDatabase, alias);
  }
}

class Prayer extends DataClass implements Insertable<Prayer> {
  final int id;
  final String key;
  final String displayName;
  final int timeMinutes;
  final int durationMinutes;
  final bool enabled;
  final int createdAt;
  final int updatedAt;
  const Prayer(
      {required this.id,
      required this.key,
      required this.displayName,
      required this.timeMinutes,
      required this.durationMinutes,
      required this.enabled,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['key'] = Variable<String>(key);
    map['display_name'] = Variable<String>(displayName);
    map['time_minutes'] = Variable<int>(timeMinutes);
    map['duration_minutes'] = Variable<int>(durationMinutes);
    map['enabled'] = Variable<bool>(enabled);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  PrayersCompanion toCompanion(bool nullToAbsent) {
    return PrayersCompanion(
      id: Value(id),
      key: Value(key),
      displayName: Value(displayName),
      timeMinutes: Value(timeMinutes),
      durationMinutes: Value(durationMinutes),
      enabled: Value(enabled),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Prayer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Prayer(
      id: serializer.fromJson<int>(json['id']),
      key: serializer.fromJson<String>(json['key']),
      displayName: serializer.fromJson<String>(json['displayName']),
      timeMinutes: serializer.fromJson<int>(json['timeMinutes']),
      durationMinutes: serializer.fromJson<int>(json['durationMinutes']),
      enabled: serializer.fromJson<bool>(json['enabled']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'key': serializer.toJson<String>(key),
      'displayName': serializer.toJson<String>(displayName),
      'timeMinutes': serializer.toJson<int>(timeMinutes),
      'durationMinutes': serializer.toJson<int>(durationMinutes),
      'enabled': serializer.toJson<bool>(enabled),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  Prayer copyWith(
          {int? id,
          String? key,
          String? displayName,
          int? timeMinutes,
          int? durationMinutes,
          bool? enabled,
          int? createdAt,
          int? updatedAt}) =>
      Prayer(
        id: id ?? this.id,
        key: key ?? this.key,
        displayName: displayName ?? this.displayName,
        timeMinutes: timeMinutes ?? this.timeMinutes,
        durationMinutes: durationMinutes ?? this.durationMinutes,
        enabled: enabled ?? this.enabled,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Prayer copyWithCompanion(PrayersCompanion data) {
    return Prayer(
      id: data.id.present ? data.id.value : this.id,
      key: data.key.present ? data.key.value : this.key,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      timeMinutes:
          data.timeMinutes.present ? data.timeMinutes.value : this.timeMinutes,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Prayer(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('displayName: $displayName, ')
          ..write('timeMinutes: $timeMinutes, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('enabled: $enabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, key, displayName, timeMinutes,
      durationMinutes, enabled, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Prayer &&
          other.id == this.id &&
          other.key == this.key &&
          other.displayName == this.displayName &&
          other.timeMinutes == this.timeMinutes &&
          other.durationMinutes == this.durationMinutes &&
          other.enabled == this.enabled &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PrayersCompanion extends UpdateCompanion<Prayer> {
  final Value<int> id;
  final Value<String> key;
  final Value<String> displayName;
  final Value<int> timeMinutes;
  final Value<int> durationMinutes;
  final Value<bool> enabled;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  const PrayersCompanion({
    this.id = const Value.absent(),
    this.key = const Value.absent(),
    this.displayName = const Value.absent(),
    this.timeMinutes = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.enabled = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PrayersCompanion.insert({
    this.id = const Value.absent(),
    required String key,
    required String displayName,
    required int timeMinutes,
    required int durationMinutes,
    this.enabled = const Value.absent(),
    required int createdAt,
    required int updatedAt,
  })  : key = Value(key),
        displayName = Value(displayName),
        timeMinutes = Value(timeMinutes),
        durationMinutes = Value(durationMinutes),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Prayer> custom({
    Expression<int>? id,
    Expression<String>? key,
    Expression<String>? displayName,
    Expression<int>? timeMinutes,
    Expression<int>? durationMinutes,
    Expression<bool>? enabled,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (key != null) 'key': key,
      if (displayName != null) 'display_name': displayName,
      if (timeMinutes != null) 'time_minutes': timeMinutes,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (enabled != null) 'enabled': enabled,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PrayersCompanion copyWith(
      {Value<int>? id,
      Value<String>? key,
      Value<String>? displayName,
      Value<int>? timeMinutes,
      Value<int>? durationMinutes,
      Value<bool>? enabled,
      Value<int>? createdAt,
      Value<int>? updatedAt}) {
    return PrayersCompanion(
      id: id ?? this.id,
      key: key ?? this.key,
      displayName: displayName ?? this.displayName,
      timeMinutes: timeMinutes ?? this.timeMinutes,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      enabled: enabled ?? this.enabled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (timeMinutes.present) {
      map['time_minutes'] = Variable<int>(timeMinutes.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrayersCompanion(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('displayName: $displayName, ')
          ..write('timeMinutes: $timeMinutes, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('enabled: $enabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DndScheduleStatesTable extends DndScheduleStates
    with TableInfo<$DndScheduleStatesTable, DndScheduleState> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DndScheduleStatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _prayerKeyMeta =
      const VerificationMeta('prayerKey');
  @override
  late final GeneratedColumn<String> prayerKey = GeneratedColumn<String>(
      'prayer_key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<int> startedAt = GeneratedColumn<int>(
      'started_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _expiresAtMeta =
      const VerificationMeta('expiresAt');
  @override
  late final GeneratedColumn<int> expiresAt = GeneratedColumn<int>(
      'expires_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _pushedAtMeta =
      const VerificationMeta('pushedAt');
  @override
  late final GeneratedColumn<int> pushedAt = GeneratedColumn<int>(
      'pushed_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns =>
      [id, prayerKey, startedAt, expiresAt, pushedAt, isActive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dnd_schedule_states';
  @override
  VerificationContext validateIntegrity(Insertable<DndScheduleState> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('prayer_key')) {
      context.handle(_prayerKeyMeta,
          prayerKey.isAcceptableOrUnknown(data['prayer_key']!, _prayerKeyMeta));
    } else if (isInserting) {
      context.missing(_prayerKeyMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(_expiresAtMeta,
          expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta));
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    if (data.containsKey('pushed_at')) {
      context.handle(_pushedAtMeta,
          pushedAt.isAcceptableOrUnknown(data['pushed_at']!, _pushedAtMeta));
    } else if (isInserting) {
      context.missing(_pushedAtMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DndScheduleState map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DndScheduleState(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      prayerKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}prayer_key'])!,
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}started_at'])!,
      expiresAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}expires_at'])!,
      pushedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pushed_at'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  $DndScheduleStatesTable createAlias(String alias) {
    return $DndScheduleStatesTable(attachedDatabase, alias);
  }
}

class DndScheduleState extends DataClass
    implements Insertable<DndScheduleState> {
  final int id;
  final String prayerKey;
  final int startedAt;
  final int expiresAt;
  final int pushedAt;
  final bool isActive;
  const DndScheduleState(
      {required this.id,
      required this.prayerKey,
      required this.startedAt,
      required this.expiresAt,
      required this.pushedAt,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['prayer_key'] = Variable<String>(prayerKey);
    map['started_at'] = Variable<int>(startedAt);
    map['expires_at'] = Variable<int>(expiresAt);
    map['pushed_at'] = Variable<int>(pushedAt);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  DndScheduleStatesCompanion toCompanion(bool nullToAbsent) {
    return DndScheduleStatesCompanion(
      id: Value(id),
      prayerKey: Value(prayerKey),
      startedAt: Value(startedAt),
      expiresAt: Value(expiresAt),
      pushedAt: Value(pushedAt),
      isActive: Value(isActive),
    );
  }

  factory DndScheduleState.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DndScheduleState(
      id: serializer.fromJson<int>(json['id']),
      prayerKey: serializer.fromJson<String>(json['prayerKey']),
      startedAt: serializer.fromJson<int>(json['startedAt']),
      expiresAt: serializer.fromJson<int>(json['expiresAt']),
      pushedAt: serializer.fromJson<int>(json['pushedAt']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'prayerKey': serializer.toJson<String>(prayerKey),
      'startedAt': serializer.toJson<int>(startedAt),
      'expiresAt': serializer.toJson<int>(expiresAt),
      'pushedAt': serializer.toJson<int>(pushedAt),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  DndScheduleState copyWith(
          {int? id,
          String? prayerKey,
          int? startedAt,
          int? expiresAt,
          int? pushedAt,
          bool? isActive}) =>
      DndScheduleState(
        id: id ?? this.id,
        prayerKey: prayerKey ?? this.prayerKey,
        startedAt: startedAt ?? this.startedAt,
        expiresAt: expiresAt ?? this.expiresAt,
        pushedAt: pushedAt ?? this.pushedAt,
        isActive: isActive ?? this.isActive,
      );
  DndScheduleState copyWithCompanion(DndScheduleStatesCompanion data) {
    return DndScheduleState(
      id: data.id.present ? data.id.value : this.id,
      prayerKey: data.prayerKey.present ? data.prayerKey.value : this.prayerKey,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      pushedAt: data.pushedAt.present ? data.pushedAt.value : this.pushedAt,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DndScheduleState(')
          ..write('id: $id, ')
          ..write('prayerKey: $prayerKey, ')
          ..write('startedAt: $startedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('pushedAt: $pushedAt, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, prayerKey, startedAt, expiresAt, pushedAt, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DndScheduleState &&
          other.id == this.id &&
          other.prayerKey == this.prayerKey &&
          other.startedAt == this.startedAt &&
          other.expiresAt == this.expiresAt &&
          other.pushedAt == this.pushedAt &&
          other.isActive == this.isActive);
}

class DndScheduleStatesCompanion extends UpdateCompanion<DndScheduleState> {
  final Value<int> id;
  final Value<String> prayerKey;
  final Value<int> startedAt;
  final Value<int> expiresAt;
  final Value<int> pushedAt;
  final Value<bool> isActive;
  const DndScheduleStatesCompanion({
    this.id = const Value.absent(),
    this.prayerKey = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.pushedAt = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  DndScheduleStatesCompanion.insert({
    this.id = const Value.absent(),
    required String prayerKey,
    required int startedAt,
    required int expiresAt,
    required int pushedAt,
    this.isActive = const Value.absent(),
  })  : prayerKey = Value(prayerKey),
        startedAt = Value(startedAt),
        expiresAt = Value(expiresAt),
        pushedAt = Value(pushedAt);
  static Insertable<DndScheduleState> custom({
    Expression<int>? id,
    Expression<String>? prayerKey,
    Expression<int>? startedAt,
    Expression<int>? expiresAt,
    Expression<int>? pushedAt,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (prayerKey != null) 'prayer_key': prayerKey,
      if (startedAt != null) 'started_at': startedAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (pushedAt != null) 'pushed_at': pushedAt,
      if (isActive != null) 'is_active': isActive,
    });
  }

  DndScheduleStatesCompanion copyWith(
      {Value<int>? id,
      Value<String>? prayerKey,
      Value<int>? startedAt,
      Value<int>? expiresAt,
      Value<int>? pushedAt,
      Value<bool>? isActive}) {
    return DndScheduleStatesCompanion(
      id: id ?? this.id,
      prayerKey: prayerKey ?? this.prayerKey,
      startedAt: startedAt ?? this.startedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      pushedAt: pushedAt ?? this.pushedAt,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (prayerKey.present) {
      map['prayer_key'] = Variable<String>(prayerKey.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<int>(startedAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<int>(expiresAt.value);
    }
    if (pushedAt.present) {
      map['pushed_at'] = Variable<int>(pushedAt.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DndScheduleStatesCompanion(')
          ..write('id: $id, ')
          ..write('prayerKey: $prayerKey, ')
          ..write('startedAt: $startedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('pushedAt: $pushedAt, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _defaultDurationMinutesMeta =
      const VerificationMeta('defaultDurationMinutes');
  @override
  late final GeneratedColumn<int> defaultDurationMinutes = GeneratedColumn<int>(
      'default_duration_minutes', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(15));
  static const VerificationMeta _lastMigrationMeta =
      const VerificationMeta('lastMigration');
  @override
  late final GeneratedColumn<int> lastMigration = GeneratedColumn<int>(
      'last_migration', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _timezoneOffsetMinutesMeta =
      const VerificationMeta('timezoneOffsetMinutes');
  @override
  late final GeneratedColumn<int> timezoneOffsetMinutes = GeneratedColumn<int>(
      'timezone_offset_minutes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, defaultDurationMinutes, lastMigration, timezoneOffsetMinutes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(Insertable<AppSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('default_duration_minutes')) {
      context.handle(
          _defaultDurationMinutesMeta,
          defaultDurationMinutes.isAcceptableOrUnknown(
              data['default_duration_minutes']!, _defaultDurationMinutesMeta));
    }
    if (data.containsKey('last_migration')) {
      context.handle(
          _lastMigrationMeta,
          lastMigration.isAcceptableOrUnknown(
              data['last_migration']!, _lastMigrationMeta));
    }
    if (data.containsKey('timezone_offset_minutes')) {
      context.handle(
          _timezoneOffsetMinutesMeta,
          timezoneOffsetMinutes.isAcceptableOrUnknown(
              data['timezone_offset_minutes']!, _timezoneOffsetMinutesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      defaultDurationMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}default_duration_minutes'])!,
      lastMigration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_migration'])!,
      timezoneOffsetMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}timezone_offset_minutes']),
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final int id;
  final int defaultDurationMinutes;
  final int lastMigration;
  final int? timezoneOffsetMinutes;
  const AppSetting(
      {required this.id,
      required this.defaultDurationMinutes,
      required this.lastMigration,
      this.timezoneOffsetMinutes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['default_duration_minutes'] = Variable<int>(defaultDurationMinutes);
    map['last_migration'] = Variable<int>(lastMigration);
    if (!nullToAbsent || timezoneOffsetMinutes != null) {
      map['timezone_offset_minutes'] = Variable<int>(timezoneOffsetMinutes);
    }
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      id: Value(id),
      defaultDurationMinutes: Value(defaultDurationMinutes),
      lastMigration: Value(lastMigration),
      timezoneOffsetMinutes: timezoneOffsetMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(timezoneOffsetMinutes),
    );
  }

  factory AppSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      id: serializer.fromJson<int>(json['id']),
      defaultDurationMinutes:
          serializer.fromJson<int>(json['defaultDurationMinutes']),
      lastMigration: serializer.fromJson<int>(json['lastMigration']),
      timezoneOffsetMinutes:
          serializer.fromJson<int?>(json['timezoneOffsetMinutes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'defaultDurationMinutes': serializer.toJson<int>(defaultDurationMinutes),
      'lastMigration': serializer.toJson<int>(lastMigration),
      'timezoneOffsetMinutes': serializer.toJson<int?>(timezoneOffsetMinutes),
    };
  }

  AppSetting copyWith(
          {int? id,
          int? defaultDurationMinutes,
          int? lastMigration,
          Value<int?> timezoneOffsetMinutes = const Value.absent()}) =>
      AppSetting(
        id: id ?? this.id,
        defaultDurationMinutes:
            defaultDurationMinutes ?? this.defaultDurationMinutes,
        lastMigration: lastMigration ?? this.lastMigration,
        timezoneOffsetMinutes: timezoneOffsetMinutes.present
            ? timezoneOffsetMinutes.value
            : this.timezoneOffsetMinutes,
      );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      id: data.id.present ? data.id.value : this.id,
      defaultDurationMinutes: data.defaultDurationMinutes.present
          ? data.defaultDurationMinutes.value
          : this.defaultDurationMinutes,
      lastMigration: data.lastMigration.present
          ? data.lastMigration.value
          : this.lastMigration,
      timezoneOffsetMinutes: data.timezoneOffsetMinutes.present
          ? data.timezoneOffsetMinutes.value
          : this.timezoneOffsetMinutes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('id: $id, ')
          ..write('defaultDurationMinutes: $defaultDurationMinutes, ')
          ..write('lastMigration: $lastMigration, ')
          ..write('timezoneOffsetMinutes: $timezoneOffsetMinutes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, defaultDurationMinutes, lastMigration, timezoneOffsetMinutes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.id == this.id &&
          other.defaultDurationMinutes == this.defaultDurationMinutes &&
          other.lastMigration == this.lastMigration &&
          other.timezoneOffsetMinutes == this.timezoneOffsetMinutes);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<int> id;
  final Value<int> defaultDurationMinutes;
  final Value<int> lastMigration;
  final Value<int?> timezoneOffsetMinutes;
  const AppSettingsCompanion({
    this.id = const Value.absent(),
    this.defaultDurationMinutes = const Value.absent(),
    this.lastMigration = const Value.absent(),
    this.timezoneOffsetMinutes = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    this.id = const Value.absent(),
    this.defaultDurationMinutes = const Value.absent(),
    this.lastMigration = const Value.absent(),
    this.timezoneOffsetMinutes = const Value.absent(),
  });
  static Insertable<AppSetting> custom({
    Expression<int>? id,
    Expression<int>? defaultDurationMinutes,
    Expression<int>? lastMigration,
    Expression<int>? timezoneOffsetMinutes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (defaultDurationMinutes != null)
        'default_duration_minutes': defaultDurationMinutes,
      if (lastMigration != null) 'last_migration': lastMigration,
      if (timezoneOffsetMinutes != null)
        'timezone_offset_minutes': timezoneOffsetMinutes,
    });
  }

  AppSettingsCompanion copyWith(
      {Value<int>? id,
      Value<int>? defaultDurationMinutes,
      Value<int>? lastMigration,
      Value<int?>? timezoneOffsetMinutes}) {
    return AppSettingsCompanion(
      id: id ?? this.id,
      defaultDurationMinutes:
          defaultDurationMinutes ?? this.defaultDurationMinutes,
      lastMigration: lastMigration ?? this.lastMigration,
      timezoneOffsetMinutes:
          timezoneOffsetMinutes ?? this.timezoneOffsetMinutes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (defaultDurationMinutes.present) {
      map['default_duration_minutes'] =
          Variable<int>(defaultDurationMinutes.value);
    }
    if (lastMigration.present) {
      map['last_migration'] = Variable<int>(lastMigration.value);
    }
    if (timezoneOffsetMinutes.present) {
      map['timezone_offset_minutes'] =
          Variable<int>(timezoneOffsetMinutes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('id: $id, ')
          ..write('defaultDurationMinutes: $defaultDurationMinutes, ')
          ..write('lastMigration: $lastMigration, ')
          ..write('timezoneOffsetMinutes: $timezoneOffsetMinutes')
          ..write(')'))
        .toString();
  }
}

class $ScheduledAlarmsTable extends ScheduledAlarms
    with TableInfo<$ScheduledAlarmsTable, ScheduledAlarm> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduledAlarmsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _prayerKeyMeta =
      const VerificationMeta('prayerKey');
  @override
  late final GeneratedColumn<String> prayerKey = GeneratedColumn<String>(
      'prayer_key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _alarmTypeMeta =
      const VerificationMeta('alarmType');
  @override
  late final GeneratedColumn<String> alarmType = GeneratedColumn<String>(
      'alarm_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scheduledAtMeta =
      const VerificationMeta('scheduledAt');
  @override
  late final GeneratedColumn<int> scheduledAt = GeneratedColumn<int>(
      'scheduled_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, prayerKey, alarmType, scheduledAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'scheduled_alarms';
  @override
  VerificationContext validateIntegrity(Insertable<ScheduledAlarm> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('prayer_key')) {
      context.handle(_prayerKeyMeta,
          prayerKey.isAcceptableOrUnknown(data['prayer_key']!, _prayerKeyMeta));
    } else if (isInserting) {
      context.missing(_prayerKeyMeta);
    }
    if (data.containsKey('alarm_type')) {
      context.handle(_alarmTypeMeta,
          alarmType.isAcceptableOrUnknown(data['alarm_type']!, _alarmTypeMeta));
    } else if (isInserting) {
      context.missing(_alarmTypeMeta);
    }
    if (data.containsKey('scheduled_at')) {
      context.handle(
          _scheduledAtMeta,
          scheduledAt.isAcceptableOrUnknown(
              data['scheduled_at']!, _scheduledAtMeta));
    } else if (isInserting) {
      context.missing(_scheduledAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScheduledAlarm map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduledAlarm(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      prayerKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}prayer_key'])!,
      alarmType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}alarm_type'])!,
      scheduledAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}scheduled_at'])!,
    );
  }

  @override
  $ScheduledAlarmsTable createAlias(String alias) {
    return $ScheduledAlarmsTable(attachedDatabase, alias);
  }
}

class ScheduledAlarm extends DataClass implements Insertable<ScheduledAlarm> {
  final int id;
  final String prayerKey;
  final String alarmType;
  final int scheduledAt;
  const ScheduledAlarm(
      {required this.id,
      required this.prayerKey,
      required this.alarmType,
      required this.scheduledAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['prayer_key'] = Variable<String>(prayerKey);
    map['alarm_type'] = Variable<String>(alarmType);
    map['scheduled_at'] = Variable<int>(scheduledAt);
    return map;
  }

  ScheduledAlarmsCompanion toCompanion(bool nullToAbsent) {
    return ScheduledAlarmsCompanion(
      id: Value(id),
      prayerKey: Value(prayerKey),
      alarmType: Value(alarmType),
      scheduledAt: Value(scheduledAt),
    );
  }

  factory ScheduledAlarm.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduledAlarm(
      id: serializer.fromJson<int>(json['id']),
      prayerKey: serializer.fromJson<String>(json['prayerKey']),
      alarmType: serializer.fromJson<String>(json['alarmType']),
      scheduledAt: serializer.fromJson<int>(json['scheduledAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'prayerKey': serializer.toJson<String>(prayerKey),
      'alarmType': serializer.toJson<String>(alarmType),
      'scheduledAt': serializer.toJson<int>(scheduledAt),
    };
  }

  ScheduledAlarm copyWith(
          {int? id, String? prayerKey, String? alarmType, int? scheduledAt}) =>
      ScheduledAlarm(
        id: id ?? this.id,
        prayerKey: prayerKey ?? this.prayerKey,
        alarmType: alarmType ?? this.alarmType,
        scheduledAt: scheduledAt ?? this.scheduledAt,
      );
  ScheduledAlarm copyWithCompanion(ScheduledAlarmsCompanion data) {
    return ScheduledAlarm(
      id: data.id.present ? data.id.value : this.id,
      prayerKey: data.prayerKey.present ? data.prayerKey.value : this.prayerKey,
      alarmType: data.alarmType.present ? data.alarmType.value : this.alarmType,
      scheduledAt:
          data.scheduledAt.present ? data.scheduledAt.value : this.scheduledAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScheduledAlarm(')
          ..write('id: $id, ')
          ..write('prayerKey: $prayerKey, ')
          ..write('alarmType: $alarmType, ')
          ..write('scheduledAt: $scheduledAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, prayerKey, alarmType, scheduledAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduledAlarm &&
          other.id == this.id &&
          other.prayerKey == this.prayerKey &&
          other.alarmType == this.alarmType &&
          other.scheduledAt == this.scheduledAt);
}

class ScheduledAlarmsCompanion extends UpdateCompanion<ScheduledAlarm> {
  final Value<int> id;
  final Value<String> prayerKey;
  final Value<String> alarmType;
  final Value<int> scheduledAt;
  const ScheduledAlarmsCompanion({
    this.id = const Value.absent(),
    this.prayerKey = const Value.absent(),
    this.alarmType = const Value.absent(),
    this.scheduledAt = const Value.absent(),
  });
  ScheduledAlarmsCompanion.insert({
    this.id = const Value.absent(),
    required String prayerKey,
    required String alarmType,
    required int scheduledAt,
  })  : prayerKey = Value(prayerKey),
        alarmType = Value(alarmType),
        scheduledAt = Value(scheduledAt);
  static Insertable<ScheduledAlarm> custom({
    Expression<int>? id,
    Expression<String>? prayerKey,
    Expression<String>? alarmType,
    Expression<int>? scheduledAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (prayerKey != null) 'prayer_key': prayerKey,
      if (alarmType != null) 'alarm_type': alarmType,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
    });
  }

  ScheduledAlarmsCompanion copyWith(
      {Value<int>? id,
      Value<String>? prayerKey,
      Value<String>? alarmType,
      Value<int>? scheduledAt}) {
    return ScheduledAlarmsCompanion(
      id: id ?? this.id,
      prayerKey: prayerKey ?? this.prayerKey,
      alarmType: alarmType ?? this.alarmType,
      scheduledAt: scheduledAt ?? this.scheduledAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (prayerKey.present) {
      map['prayer_key'] = Variable<String>(prayerKey.value);
    }
    if (alarmType.present) {
      map['alarm_type'] = Variable<String>(alarmType.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<int>(scheduledAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduledAlarmsCompanion(')
          ..write('id: $id, ')
          ..write('prayerKey: $prayerKey, ')
          ..write('alarmType: $alarmType, ')
          ..write('scheduledAt: $scheduledAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PrayersTable prayers = $PrayersTable(this);
  late final $DndScheduleStatesTable dndScheduleStates =
      $DndScheduleStatesTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $ScheduledAlarmsTable scheduledAlarms =
      $ScheduledAlarmsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [prayers, dndScheduleStates, appSettings, scheduledAlarms];
}

typedef $$PrayersTableCreateCompanionBuilder = PrayersCompanion Function({
  Value<int> id,
  required String key,
  required String displayName,
  required int timeMinutes,
  required int durationMinutes,
  Value<bool> enabled,
  required int createdAt,
  required int updatedAt,
});
typedef $$PrayersTableUpdateCompanionBuilder = PrayersCompanion Function({
  Value<int> id,
  Value<String> key,
  Value<String> displayName,
  Value<int> timeMinutes,
  Value<int> durationMinutes,
  Value<bool> enabled,
  Value<int> createdAt,
  Value<int> updatedAt,
});

class $$PrayersTableFilterComposer
    extends Composer<_$AppDatabase, $PrayersTable> {
  $$PrayersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timeMinutes => $composableBuilder(
      column: $table.timeMinutes, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get enabled => $composableBuilder(
      column: $table.enabled, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$PrayersTableOrderingComposer
    extends Composer<_$AppDatabase, $PrayersTable> {
  $$PrayersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timeMinutes => $composableBuilder(
      column: $table.timeMinutes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get enabled => $composableBuilder(
      column: $table.enabled, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$PrayersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrayersTable> {
  $$PrayersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => column);

  GeneratedColumn<int> get timeMinutes => $composableBuilder(
      column: $table.timeMinutes, builder: (column) => column);

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes, builder: (column) => column);

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PrayersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PrayersTable,
    Prayer,
    $$PrayersTableFilterComposer,
    $$PrayersTableOrderingComposer,
    $$PrayersTableAnnotationComposer,
    $$PrayersTableCreateCompanionBuilder,
    $$PrayersTableUpdateCompanionBuilder,
    (Prayer, BaseReferences<_$AppDatabase, $PrayersTable, Prayer>),
    Prayer,
    PrefetchHooks Function()> {
  $$PrayersTableTableManager(_$AppDatabase db, $PrayersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrayersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrayersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PrayersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> key = const Value.absent(),
            Value<String> displayName = const Value.absent(),
            Value<int> timeMinutes = const Value.absent(),
            Value<int> durationMinutes = const Value.absent(),
            Value<bool> enabled = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int> updatedAt = const Value.absent(),
          }) =>
              PrayersCompanion(
            id: id,
            key: key,
            displayName: displayName,
            timeMinutes: timeMinutes,
            durationMinutes: durationMinutes,
            enabled: enabled,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String key,
            required String displayName,
            required int timeMinutes,
            required int durationMinutes,
            Value<bool> enabled = const Value.absent(),
            required int createdAt,
            required int updatedAt,
          }) =>
              PrayersCompanion.insert(
            id: id,
            key: key,
            displayName: displayName,
            timeMinutes: timeMinutes,
            durationMinutes: durationMinutes,
            enabled: enabled,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PrayersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PrayersTable,
    Prayer,
    $$PrayersTableFilterComposer,
    $$PrayersTableOrderingComposer,
    $$PrayersTableAnnotationComposer,
    $$PrayersTableCreateCompanionBuilder,
    $$PrayersTableUpdateCompanionBuilder,
    (Prayer, BaseReferences<_$AppDatabase, $PrayersTable, Prayer>),
    Prayer,
    PrefetchHooks Function()>;
typedef $$DndScheduleStatesTableCreateCompanionBuilder
    = DndScheduleStatesCompanion Function({
  Value<int> id,
  required String prayerKey,
  required int startedAt,
  required int expiresAt,
  required int pushedAt,
  Value<bool> isActive,
});
typedef $$DndScheduleStatesTableUpdateCompanionBuilder
    = DndScheduleStatesCompanion Function({
  Value<int> id,
  Value<String> prayerKey,
  Value<int> startedAt,
  Value<int> expiresAt,
  Value<int> pushedAt,
  Value<bool> isActive,
});

class $$DndScheduleStatesTableFilterComposer
    extends Composer<_$AppDatabase, $DndScheduleStatesTable> {
  $$DndScheduleStatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get prayerKey => $composableBuilder(
      column: $table.prayerKey, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get expiresAt => $composableBuilder(
      column: $table.expiresAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get pushedAt => $composableBuilder(
      column: $table.pushedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));
}

class $$DndScheduleStatesTableOrderingComposer
    extends Composer<_$AppDatabase, $DndScheduleStatesTable> {
  $$DndScheduleStatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get prayerKey => $composableBuilder(
      column: $table.prayerKey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get expiresAt => $composableBuilder(
      column: $table.expiresAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get pushedAt => $composableBuilder(
      column: $table.pushedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));
}

class $$DndScheduleStatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DndScheduleStatesTable> {
  $$DndScheduleStatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get prayerKey =>
      $composableBuilder(column: $table.prayerKey, builder: (column) => column);

  GeneratedColumn<int> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<int> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<int> get pushedAt =>
      $composableBuilder(column: $table.pushedAt, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $$DndScheduleStatesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DndScheduleStatesTable,
    DndScheduleState,
    $$DndScheduleStatesTableFilterComposer,
    $$DndScheduleStatesTableOrderingComposer,
    $$DndScheduleStatesTableAnnotationComposer,
    $$DndScheduleStatesTableCreateCompanionBuilder,
    $$DndScheduleStatesTableUpdateCompanionBuilder,
    (
      DndScheduleState,
      BaseReferences<_$AppDatabase, $DndScheduleStatesTable, DndScheduleState>
    ),
    DndScheduleState,
    PrefetchHooks Function()> {
  $$DndScheduleStatesTableTableManager(
      _$AppDatabase db, $DndScheduleStatesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DndScheduleStatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DndScheduleStatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DndScheduleStatesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> prayerKey = const Value.absent(),
            Value<int> startedAt = const Value.absent(),
            Value<int> expiresAt = const Value.absent(),
            Value<int> pushedAt = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              DndScheduleStatesCompanion(
            id: id,
            prayerKey: prayerKey,
            startedAt: startedAt,
            expiresAt: expiresAt,
            pushedAt: pushedAt,
            isActive: isActive,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String prayerKey,
            required int startedAt,
            required int expiresAt,
            required int pushedAt,
            Value<bool> isActive = const Value.absent(),
          }) =>
              DndScheduleStatesCompanion.insert(
            id: id,
            prayerKey: prayerKey,
            startedAt: startedAt,
            expiresAt: expiresAt,
            pushedAt: pushedAt,
            isActive: isActive,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DndScheduleStatesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DndScheduleStatesTable,
    DndScheduleState,
    $$DndScheduleStatesTableFilterComposer,
    $$DndScheduleStatesTableOrderingComposer,
    $$DndScheduleStatesTableAnnotationComposer,
    $$DndScheduleStatesTableCreateCompanionBuilder,
    $$DndScheduleStatesTableUpdateCompanionBuilder,
    (
      DndScheduleState,
      BaseReferences<_$AppDatabase, $DndScheduleStatesTable, DndScheduleState>
    ),
    DndScheduleState,
    PrefetchHooks Function()>;
typedef $$AppSettingsTableCreateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<int> id,
  Value<int> defaultDurationMinutes,
  Value<int> lastMigration,
  Value<int?> timezoneOffsetMinutes,
});
typedef $$AppSettingsTableUpdateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<int> id,
  Value<int> defaultDurationMinutes,
  Value<int> lastMigration,
  Value<int?> timezoneOffsetMinutes,
});

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get defaultDurationMinutes => $composableBuilder(
      column: $table.defaultDurationMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lastMigration => $composableBuilder(
      column: $table.lastMigration, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timezoneOffsetMinutes => $composableBuilder(
      column: $table.timezoneOffsetMinutes,
      builder: (column) => ColumnFilters(column));
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get defaultDurationMinutes => $composableBuilder(
      column: $table.defaultDurationMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lastMigration => $composableBuilder(
      column: $table.lastMigration,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timezoneOffsetMinutes => $composableBuilder(
      column: $table.timezoneOffsetMinutes,
      builder: (column) => ColumnOrderings(column));
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get defaultDurationMinutes => $composableBuilder(
      column: $table.defaultDurationMinutes, builder: (column) => column);

  GeneratedColumn<int> get lastMigration => $composableBuilder(
      column: $table.lastMigration, builder: (column) => column);

  GeneratedColumn<int> get timezoneOffsetMinutes => $composableBuilder(
      column: $table.timezoneOffsetMinutes, builder: (column) => column);
}

class $$AppSettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()> {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> defaultDurationMinutes = const Value.absent(),
            Value<int> lastMigration = const Value.absent(),
            Value<int?> timezoneOffsetMinutes = const Value.absent(),
          }) =>
              AppSettingsCompanion(
            id: id,
            defaultDurationMinutes: defaultDurationMinutes,
            lastMigration: lastMigration,
            timezoneOffsetMinutes: timezoneOffsetMinutes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> defaultDurationMinutes = const Value.absent(),
            Value<int> lastMigration = const Value.absent(),
            Value<int?> timezoneOffsetMinutes = const Value.absent(),
          }) =>
              AppSettingsCompanion.insert(
            id: id,
            defaultDurationMinutes: defaultDurationMinutes,
            lastMigration: lastMigration,
            timezoneOffsetMinutes: timezoneOffsetMinutes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()>;
typedef $$ScheduledAlarmsTableCreateCompanionBuilder = ScheduledAlarmsCompanion
    Function({
  Value<int> id,
  required String prayerKey,
  required String alarmType,
  required int scheduledAt,
});
typedef $$ScheduledAlarmsTableUpdateCompanionBuilder = ScheduledAlarmsCompanion
    Function({
  Value<int> id,
  Value<String> prayerKey,
  Value<String> alarmType,
  Value<int> scheduledAt,
});

class $$ScheduledAlarmsTableFilterComposer
    extends Composer<_$AppDatabase, $ScheduledAlarmsTable> {
  $$ScheduledAlarmsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get prayerKey => $composableBuilder(
      column: $table.prayerKey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get alarmType => $composableBuilder(
      column: $table.alarmType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get scheduledAt => $composableBuilder(
      column: $table.scheduledAt, builder: (column) => ColumnFilters(column));
}

class $$ScheduledAlarmsTableOrderingComposer
    extends Composer<_$AppDatabase, $ScheduledAlarmsTable> {
  $$ScheduledAlarmsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get prayerKey => $composableBuilder(
      column: $table.prayerKey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get alarmType => $composableBuilder(
      column: $table.alarmType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get scheduledAt => $composableBuilder(
      column: $table.scheduledAt, builder: (column) => ColumnOrderings(column));
}

class $$ScheduledAlarmsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScheduledAlarmsTable> {
  $$ScheduledAlarmsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get prayerKey =>
      $composableBuilder(column: $table.prayerKey, builder: (column) => column);

  GeneratedColumn<String> get alarmType =>
      $composableBuilder(column: $table.alarmType, builder: (column) => column);

  GeneratedColumn<int> get scheduledAt => $composableBuilder(
      column: $table.scheduledAt, builder: (column) => column);
}

class $$ScheduledAlarmsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ScheduledAlarmsTable,
    ScheduledAlarm,
    $$ScheduledAlarmsTableFilterComposer,
    $$ScheduledAlarmsTableOrderingComposer,
    $$ScheduledAlarmsTableAnnotationComposer,
    $$ScheduledAlarmsTableCreateCompanionBuilder,
    $$ScheduledAlarmsTableUpdateCompanionBuilder,
    (
      ScheduledAlarm,
      BaseReferences<_$AppDatabase, $ScheduledAlarmsTable, ScheduledAlarm>
    ),
    ScheduledAlarm,
    PrefetchHooks Function()> {
  $$ScheduledAlarmsTableTableManager(
      _$AppDatabase db, $ScheduledAlarmsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScheduledAlarmsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScheduledAlarmsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScheduledAlarmsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> prayerKey = const Value.absent(),
            Value<String> alarmType = const Value.absent(),
            Value<int> scheduledAt = const Value.absent(),
          }) =>
              ScheduledAlarmsCompanion(
            id: id,
            prayerKey: prayerKey,
            alarmType: alarmType,
            scheduledAt: scheduledAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String prayerKey,
            required String alarmType,
            required int scheduledAt,
          }) =>
              ScheduledAlarmsCompanion.insert(
            id: id,
            prayerKey: prayerKey,
            alarmType: alarmType,
            scheduledAt: scheduledAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ScheduledAlarmsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ScheduledAlarmsTable,
    ScheduledAlarm,
    $$ScheduledAlarmsTableFilterComposer,
    $$ScheduledAlarmsTableOrderingComposer,
    $$ScheduledAlarmsTableAnnotationComposer,
    $$ScheduledAlarmsTableCreateCompanionBuilder,
    $$ScheduledAlarmsTableUpdateCompanionBuilder,
    (
      ScheduledAlarm,
      BaseReferences<_$AppDatabase, $ScheduledAlarmsTable, ScheduledAlarm>
    ),
    ScheduledAlarm,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PrayersTableTableManager get prayers =>
      $$PrayersTableTableManager(_db, _db.prayers);
  $$DndScheduleStatesTableTableManager get dndScheduleStates =>
      $$DndScheduleStatesTableTableManager(_db, _db.dndScheduleStates);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$ScheduledAlarmsTableTableManager get scheduledAlarms =>
      $$ScheduledAlarmsTableTableManager(_db, _db.scheduledAlarms);
}
