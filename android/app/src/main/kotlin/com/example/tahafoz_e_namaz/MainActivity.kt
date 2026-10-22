package com.example.tahafoz_e_namaz

import android.app.AlarmManager
import android.app.NotificationManager
import android.content.Context
import android.content.Intent
import android.app.PendingIntent
import android.app.NotificationChannel
import android.os.Build
import android.os.PowerManager
import android.provider.Settings
import android.net.Uri
import android.util.Log
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
	private val CHANNEL = "tahafooz/dnd"

	override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
		super.configureFlutterEngine(flutterEngine)

		MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
			when (call.method) {
				"isNotificationPolicyAccessGranted" -> {
					val nm = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
					result.success(nm.isNotificationPolicyAccessGranted)
				}
				"openNotificationPolicySettings" -> {
					val intent = Intent(Settings.ACTION_NOTIFICATION_POLICY_ACCESS_SETTINGS)
					intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
					startActivity(intent)
					result.success(null)
				}
				"setInterruptionFilter" -> {
					val filter = (call.argument<Int>("filter") ?: 0)
					val nm = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
					// This requires the app to have Notification Policy Access granted.
					nm.setInterruptionFilter(filter)
					result.success(null)
				}
				"openIgnoreBatteryOptimizationsSettings" -> {
					val intent = Intent()
					intent.action = Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS
					intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
					startActivity(intent)
					result.success(null)
				}
				"openExactAlarmSettings" -> {
					if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
						val intent = Intent(Settings.ACTION_REQUEST_SCHEDULE_EXACT_ALARM).apply {
							data = Uri.parse("package:$packageName")
						}
						intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
						startActivity(intent)
					}
					result.success(null)
				}
				"isIgnoringBatteryOptimizations" -> {
					val pm = getSystemService(Context.POWER_SERVICE) as PowerManager
					val isIgnored = pm.isIgnoringBatteryOptimizations(packageName)
					result.success(isIgnored)
				}
				"isScheduleExactAlarmAllowed" -> {
					val am = getSystemService(Context.ALARM_SERVICE) as AlarmManager
					if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
						result.success(am.canScheduleExactAlarms())
					} else {
						result.success(true)
					}
				}
				"rescheduleAlarms" -> {
					Log.i("Tahafooz", "rescheduleAlarms requested via BOOT_COMPLETED")
					result.success(null)
				}
				else -> result.notImplemented()
			}
		}

		// Notification MethodChannel: show/cancel persistent DND notification with End action
		MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "tahafooz/notify").setMethodCallHandler { call, result ->
			when (call.method) {
				"showDnd" -> {
					val prayerKey = call.argument<String>("prayerKey") ?: "prayer"
					val channelId = "tahafooz_dnd_channel"
					if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
						val ch = NotificationChannel(channelId, "Do Not Disturb", NotificationManager.IMPORTANCE_LOW)
						val nm = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
						nm.createNotificationChannel(ch)
					}
					val intent = Intent(this, MainActivity::class.java)
					intent.putExtra("tahafooz_action", "endDnd")
					intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
					val pending = PendingIntent.getActivity(this, 0, intent, PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT)

					val builder = NotificationCompat.Builder(this, channelId)
						.setContentTitle("Do Not Disturb enabled")
						.setContentText("Silencing for $prayerKey")
						.setSmallIcon(R.mipmap.ic_launcher)
						.setOngoing(true)
						.addAction(0, "End DND", pending)

					with(NotificationManagerCompat.from(this)) {
						notify(1001, builder.build())
					}
					result.success(null)
				}
				"cancelDnd" -> {
					with(NotificationManagerCompat.from(this)) {
						cancel(1001)
					}
					result.success(null)
				}
				else -> result.notImplemented()
			}
		}
	}

	override fun onNewIntent(intent: Intent) {
		super.onNewIntent(intent)
		val action = intent.getStringExtra("tahafooz_action")
		if (action == "endDnd") {
			// When user taps End DND, bring app to foreground and let Dart handle clearing state via MethodChannel
			flutterEngine?.dartExecutor?.binaryMessenger?.let { messenger ->
				MethodChannel(messenger, "tahafooz/notify_action").invokeMethod("endDnd", null)
			}
		}
	}
}
