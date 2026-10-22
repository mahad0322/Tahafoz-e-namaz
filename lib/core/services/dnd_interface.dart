abstract class DndInterface {
  /// Returns true if the app currently has Notification Policy Access
  /// required to change system DND state on Android.
  Future<bool> isNotificationPolicyAccessGranted();

  /// Open the system settings screen where the user can grant Notification
  /// Policy Access. Implementations should be platform-aware no-op on iOS.
  Future<void> openNotificationPolicySettings();

  /// Set interruption filter. Android's NotificationManager.setInterruptionFilter
  /// accepts integer constants; the native plugin will map friendly values.
  Future<void> setInterruptionFilter(int filter);
}
