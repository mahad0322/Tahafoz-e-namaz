import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/providers.dart';
import '../../prayers/presentation/home_page.dart';

class PermissionFlowPage extends ConsumerStatefulWidget {
  const PermissionFlowPage({super.key});

  @override
  ConsumerState<PermissionFlowPage> createState() => _PermissionFlowPageState();
}

class _PermissionFlowPageState extends ConsumerState<PermissionFlowPage>
    with WidgetsBindingObserver {
  bool _dndGranted = false;
  bool _notifGranted = false;
  bool _batteryIgnored = false;
  bool _exactAlarmAllowed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _refreshStatuses();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _refreshStatuses();
  }

  Future<void> _refreshStatuses() async {
    final dnd = ref.read(dndProvider);
    final dndGranted = await dnd.isNotificationPolicyAccessGranted();
    final notifStatus = await Permission.notification.status;
    final batteryIgnored = await (dnd).isIgnoringBatteryOptimizations();
    final exactAllowed = await (dnd).isScheduleExactAlarmAllowed();

    if (!mounted) return;
    setState(() {
      _dndGranted = dndGranted;
      _notifGranted = notifStatus.isGranted;
      _batteryIgnored = batteryIgnored;
      _exactAlarmAllowed = exactAllowed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dnd = ref.read(dndProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Permissions & Setup')),
      body: RefreshIndicator(
        onRefresh: _refreshStatuses,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ListTile(
              title: const Text('Notification Policy Access (DND)'),
              subtitle: Text(_dndGranted ? 'Granted' : 'Required'),
              trailing: ElevatedButton(
                onPressed: _dndGranted
                    ? null
                    : () async {
                        await dnd.openNotificationPolicySettings();
                      },
                child: const Text('Open'),
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('POST_NOTIFICATIONS'),
              subtitle: Text(_notifGranted ? 'Granted' : 'Tap to request'),
              trailing: ElevatedButton(
                onPressed: _notifGranted
                    ? null
                    : () async {
                        await Permission.notification.request();
                        await _refreshStatuses();
                      },
                child: const Text('Request'),
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('Ignore Battery Optimizations'),
              subtitle: Text(_batteryIgnored ? 'Excluded' : 'Recommended'),
              trailing: ElevatedButton(
                onPressed: _batteryIgnored
                    ? null
                    : () async {
                        await dnd.openIgnoreBatteryOptimizationsSettings();
                      },
                child: const Text('Open'),
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('Exact alarm scheduling'),
              subtitle: Text(_exactAlarmAllowed
                  ? 'Allowed'
                  : 'Required for reliable prayer alarms'),
              trailing: ElevatedButton(
                onPressed: _exactAlarmAllowed
                    ? null
                    : () async {
                        await dnd.openExactAlarmSettings();
                      },
                child: const Text('Open'),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final navigator = Navigator.of(context);
                final messenger = ScaffoldMessenger.of(context);
                await _refreshStatuses();
                if (_dndGranted && _notifGranted && _exactAlarmAllowed) {
                  if (!mounted) return;
                  navigator.pushReplacement(
                      MaterialPageRoute(builder: (_) => const HomePage()));
                  return;
                }
                if (!mounted) return;
                messenger.showSnackBar(const SnackBar(
                    content: Text(
                        'Please grant DND, notifications, and exact alarm access.')));
              },
              child: const Text('Finish setup'),
            ),
          ],
        ),
      ),
    );
  }
}
