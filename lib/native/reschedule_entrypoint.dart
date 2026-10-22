@pragma('vm:entry-point')
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:tahafoz_e_namaz/features/prayers/data/local/database.dart';

/// Headless Dart entrypoint invoked by Android `RescheduleService`.
@pragma('vm:entry-point')
import 'package:tahafoz_e_namaz/services/alarm_service.dart';

Future<void> rescheduleEntrypoint() async {
  WidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('tahafooz/bootstrap');

  Future<void> performReschedule() async {
    final db = AppDatabase();
    try {
      final alarmService = AlarmService(db);
      try {
        await alarmService.init();
      } catch (_) {
        // ignore initialization errors on unsupported platforms
      }
      try {
        await alarmService.scheduleAllEnabledPrayers();
        debugPrint('RescheduleEntrypoint: scheduled all enabled prayers');
      } catch (e) {
        debugPrint('RescheduleEntrypoint scheduling error: $e');
      }

      // Notify native that reschedule work is complete so native service can stop.
      try {
        await channel.invokeMethod('rescheduleComplete');
      } catch (e) {
        debugPrint('RescheduleEntrypoint: failed to notify native: $e');
      }
    } catch (e, st) {
      debugPrint('RescheduleEntrypoint error: $e\n$st');
    } finally {
      await db.close();
    }
  }

  // Register method call handler so native code can request reschedule.
  channel.setMethodCallHandler((call) async {
    if (call.method == 'reschedule') {
      await performReschedule();
      return null;
    }
    return null;
  });

  // Perform reschedule immediately when entrypoint runs.
  await performReschedule();
}
