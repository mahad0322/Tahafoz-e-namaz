import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tahafoz_e_namaz/core/providers.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  static const _bootstrapChannel = MethodChannel('tahafooz/bootstrap');

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool _isDnd = false;

  Future<void> _rescheduleNow(BuildContext context) async {
    try {
      await SettingsPage._bootstrapChannel.invokeMethod('reschedule');
      if (context.mounted)
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Reschedule requested')));
    } catch (e) {
      if (context.mounted)
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Reschedule failed: $e')));
    }
  }

  Future<void> _toggleDnd(bool v) async {
    setState(() => _isDnd = v);
    final dnd = ref.read(dndProvider);
    if (v) {
      await dnd.setInterruptionFilter(3); // none
    } else {
      await dnd.setInterruptionFilter(1); // all
      // clear DB schedule states
      final db = ref.read(databaseProvider);
      await db.delete(db.dndScheduleStates).go();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () => _rescheduleNow(context),
              icon: const Icon(Icons.sync),
              label: const Text('Reschedule now'),
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              title: const Text('Manual DND override'),
              subtitle: const Text('Temporarily enable/disable Do Not Disturb'),
              value: _isDnd,
              onChanged: _toggleDnd,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {
                final db = ref.read(databaseProvider);
                await db.delete(db.dndScheduleStates).go();
                final dnd = ref.read(dndProvider);
                await dnd.setInterruptionFilter(1);
                if (context.mounted)
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Cleared active DND states')));
              },
              child: const Text('Clear active DND'),
            ),
            const SizedBox(height: 12),
            const Text(
                'Use reschedule after edits or to recover alarms if reboot didn\'t trigger.'),
          ],
        ),
      ),
    );
  }
}
