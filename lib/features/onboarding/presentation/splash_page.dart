import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/providers.dart';
import '../../prayers/presentation/home_page.dart';
import 'onboarding_page.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    // Ensure DB is initialized
    final db = ref.read(databaseProvider);
    // trigger a simple read to force open
    await db.select(db.prayers).get();

    // Check permissions
    final dnd = ref.read(dndProvider);
    final hasDnd = await dnd.isNotificationPolicyAccessGranted();
    final notifStatus = await Permission.notification.status;
    final exactAlarmAllowed = await dnd.isScheduleExactAlarmAllowed();

    final missing = <String>[];
    if (!hasDnd) missing.add('Notification Policy Access (DND)');
    if (!notifStatus.isGranted) missing.add('POST_NOTIFICATIONS');
    if (!exactAlarmAllowed) missing.add('Exact alarm scheduling');

    if (missing.isEmpty) {
      if (!mounted) return;
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
    } else {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => OnboardingPage(missingPermissions: missing)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
