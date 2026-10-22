import 'package:flutter/services.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  static const MethodChannel _channel = MethodChannel('tahafooz/notify');

  Future<void> showDndActive(String prayerKey) async {
    try {
      await _channel.invokeMethod('showDnd', {'prayerKey': prayerKey});
    } catch (e) {
      // ignore on tests or unsupported platforms
    }
  }

  Future<void> cancelDnd() async {
    try {
      await _channel.invokeMethod('cancelDnd');
    } catch (e) {
      // ignore
    }
  }
}
