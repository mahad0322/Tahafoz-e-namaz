import 'package:flutter/services.dart';
import 'package:tahafoz_e_namaz/services/notification_action_service.dart';

void registerNotificationActionHandler() {
  const channel = MethodChannel('tahafooz/notify_action');
  channel.setMethodCallHandler((call) async {
    if (call.method == 'endDnd') {
      // Emit event for app to handle (allows undo UI if app is foreground)
      NotificationActionService().emit('endDnd');
    }
    return null;
  });
}
