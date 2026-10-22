package com.example.tahafoz_e_namaz

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log

class BootReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action == Intent.ACTION_BOOT_COMPLETED) {
            // NOTE: For production we should start a headless Flutter engine or
            // a dedicated foreground service which initializes a FlutterEngine
            // and invokes a Dart callback to reschedule alarms from the
            // Drift database. Starting an activity on boot is intrusive, so we
            // only log here and rely on the Dart side to reschedule when the
            // app is next opened. This is a TODO for a full implementation.
            Log.i("Tahafooz", "BOOT_COMPLETED received — reschedule alarms here.")

            // Example minimal behavior: start MainActivity to give the app a
            // chance to run rescheduling logic. Prefer implementing headless
            // reschedule with a FlutterEngine for a silent boot-time reschedule.
            val i = Intent(context, MainActivity::class.java)
            i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            i.action = "ACTION_RESCHEDULE_ALARMS"
            context.startActivity(i)
        }
    }
}
