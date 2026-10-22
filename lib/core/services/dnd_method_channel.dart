import 'package:flutter/services.dart';
import 'dnd_interface.dart';

class MethodChannelDnd implements DndInterface {
  static const MethodChannel _channel = MethodChannel('tahafooz/dnd');

  @override
  Future<bool> isNotificationPolicyAccessGranted() async {
    try {
      final res = await _channel.invokeMethod<bool>('isNotificationPolicyAccessGranted');
      return res ?? false;
    } on PlatformException {
      return false;
    }
  }

  @override
  Future<void> openNotificationPolicySettings() async {
    try {
      await _channel.invokeMethod('openNotificationPolicySettings');
    } on PlatformException {
      // ignore
    }
  }

  Future<void> openIgnoreBatteryOptimizationsSettings() async {
    try {
      await _channel.invokeMethod('openIgnoreBatteryOptimizationsSettings');
    } on PlatformException {
      // ignore
    }
  }

  Future<void> openExactAlarmSettings() async {
    try {
      await _channel.invokeMethod('openExactAlarmSettings');
    } on PlatformException {
      // ignore
    }
  }

  Future<bool> isIgnoringBatteryOptimizations() async {
    try {
      final res = await _channel.invokeMethod<bool>('isIgnoringBatteryOptimizations');
      return res ?? false;
    } on PlatformException {
      return false;
    }
  }

  Future<bool> isScheduleExactAlarmAllowed() async {
    try {
      final res = await _channel.invokeMethod<bool>('isScheduleExactAlarmAllowed');
      return res ?? false;
    } on PlatformException {
      return false;
    }
  }

  @override
  Future<void> setInterruptionFilter(int filter) async {
    try {
      await _channel.invokeMethod('setInterruptionFilter', {'filter': filter});
    } on PlatformException {
      // ignore
    }
  }
}
