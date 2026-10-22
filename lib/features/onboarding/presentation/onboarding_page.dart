import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import 'permission_flow.dart';
import 'package:permission_handler/permission_handler.dart';

class OnboardingPage extends ConsumerWidget {
  final List<String> missingPermissions;
  const OnboardingPage({super.key, required this.missingPermissions});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dnd = ref.read(dndProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Setup required')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('The app needs a few permissions to automate DND:'),
            const SizedBox(height: 12),
            for (final p in missingPermissions) Text('- $p'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                await dnd.openNotificationPolicySettings();
              },
              child: const Text('Open DND (Notification policy) settings'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                await dnd.openExactAlarmSettings();
              },
              child: const Text('Open exact alarm settings'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                // open app settings for notifications and battery exemptions
                await openAppSettings();
              },
              child: const Text('Open App settings (notifications, battery)'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const PermissionFlowPage()));
              },
              child: const Text('Open full permission checklist'),
            ),
            const SizedBox(height: 12),
            const Text('Notes:'),
            const Text(
                '• Exact alarm scheduling and battery exemptions may require manual steps in system settings.'),
          ],
        ),
      ),
    );
  }
}
