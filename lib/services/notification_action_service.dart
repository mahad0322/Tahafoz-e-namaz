import 'dart:async';

class NotificationActionService {
  static final NotificationActionService _instance = NotificationActionService._internal();
  factory NotificationActionService() => _instance;
  NotificationActionService._internal();

  final StreamController<String> _ctrl = StreamController.broadcast();

  Stream<String> get stream => _ctrl.stream;

  void emit(String action) => _ctrl.add(action);
}
