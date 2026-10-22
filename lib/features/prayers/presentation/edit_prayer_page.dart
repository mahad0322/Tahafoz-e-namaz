import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:tahafoz_e_namaz/features/prayers/data/local/database.dart';
import 'package:tahafoz_e_namaz/features/prayers/data/prayers_repository.dart';
import 'package:tahafoz_e_namaz/core/providers.dart';
import 'package:tahafoz_e_namaz/services/alarm_service.dart';

class EditPrayerPage extends ConsumerStatefulWidget {
  final String prayerKey;
  const EditPrayerPage({super.key, required this.prayerKey});

  @override
  ConsumerState<EditPrayerPage> createState() => _EditPrayerPageState();
}

class _EditPrayerPageState extends ConsumerState<EditPrayerPage> {
  TimeOfDay? _time;
  int _duration = 15;
  bool _enabled = true;

  @override
  void initState() {
    super.initState();
    _loadPrayer();
  }

  Future<void> _loadPrayer() async {
    final db = ref.read(databaseProvider);
    final rows = await (db.select(db.prayers)..where((t) => t.key.equals(widget.prayerKey))).get();
    if (rows.isNotEmpty) {
      final p = rows.first;
      setState(() {
        _time = TimeOfDay(hour: p.timeMinutes ~/ 60, minute: p.timeMinutes % 60);
        _duration = p.durationMinutes;
        _enabled = p.enabled;
      });
    } else {
      setState(() {
        _time = const TimeOfDay(hour: 12, minute: 0);
      });
    }
  }

  Future<void> _save() async {
    if (_time == null) return;
    final db = ref.read(databaseProvider);
    final alarmService = AlarmService(db);
    final repo = PrayersRepository(db, alarmService);

    final minutes = _time!.hour * 60 + _time!.minute;
    final companion = PrayersCompanion(
      key: Value(widget.prayerKey),
      displayName: Value(widget.prayerKey.capitalize()),
      timeMinutes: Value(minutes),
      durationMinutes: Value(_duration),
      enabled: Value(_enabled),
    );

    await repo.savePrayer(companion);
    if (!mounted) return;
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit ${widget.prayerKey}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: const Text('Time'),
              subtitle: Text(_time?.format(context) ?? '-'),
              trailing: ElevatedButton(
                onPressed: () async {
                  final t = await showTimePicker(context: context, initialTime: _time ?? const TimeOfDay(hour: 12, minute: 0));
                  if (t != null) setState(() => _time = t);
                },
                child: const Text('Pick'),
              ),
            ),
            ListTile(
              title: const Text('Duration (minutes)'),
              subtitle: Text('$_duration'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () => setState(() => _duration = (_duration - 5).clamp(10, 30)), icon: const Icon(Icons.remove)),
                  IconButton(onPressed: () => setState(() => _duration = (_duration + 5).clamp(10, 30)), icon: const Icon(Icons.add)),
                ],
              ),
            ),
            SwitchListTile(
              title: const Text('Enabled'),
              value: _enabled,
              onChanged: (v) => setState(() => _enabled = v),
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: _save, child: const Text('Save')),
          ],
        ),
      ),
    );
  }
}

extension _Cap on String {
  String capitalize() => isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}
