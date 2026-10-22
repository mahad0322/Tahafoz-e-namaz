import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'native/notification_action_handler.dart';
import 'services/notification_action_service.dart';
import 'package:tahafoz_e_namaz/features/prayers/data/local/database.dart';
import 'core/services/dnd_method_channel.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Register handler for notification actions coming from native
  registerNotificationActionHandler();
  // Listen for notification actions and show undo UI when possible
  NotificationActionService().stream.listen((action) {
    if (action == 'endDnd') {
      _handleEndDndAction();
    }
  });

  runApp(ProviderScope(child: TahafoozApp(navigatorKey: navigatorKey)));
}

void _handleEndDndAction() {
  final completer = Completer<bool>();
  final ctx = navigatorKey.currentContext;
  if (ctx != null) {
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      content: const Text('End Do Not Disturb?'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          if (!completer.isCompleted) completer.complete(true);
        },
      ),
      duration: const Duration(seconds: 5),
    ));
  }

  _finalizeEndDnd(completer);
}

Future<void> _finalizeEndDnd(Completer<bool> completer) async {
  final undone = await completer.future.timeout(const Duration(seconds: 5), onTimeout: () => false);
  if (!undone) {
    final db = AppDatabase();
    try {
      await db.delete(db.dndScheduleStates).go();
      final dnd = MethodChannelDnd();
      await dnd.setInterruptionFilter(1);
    } finally {
      await db.close();
    }
  }
}
