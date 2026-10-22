package com.example.tahafoz_e_namaz

import android.app.Service
import android.content.Intent
import android.os.IBinder
import android.util.Log
import io.flutter.FlutterInjector
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.embedding.engine.dart.DartExecutor.DartEntrypoint

class RescheduleService : Service() {
    private var engine: FlutterEngine? = null

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        Thread {
            try {
                Log.i("Tahafooz", "Starting headless FlutterEngine for reschedule")
                val loader = FlutterInjector.instance().flutterLoader()
                if (!loader.initialized()) {
                    loader.startInitialization(applicationContext)
                }
                loader.ensureInitializationComplete(applicationContext, null)

                engine = FlutterEngine(applicationContext)
                // Execute a Dart entrypoint named "rescheduleEntrypoint"
                val entrypoint = DartEntrypoint(loader.findAppBundlePath(), "rescheduleEntrypoint")
                engine?.dartExecutor?.executeDartEntrypoint(entrypoint)

                // Set up a MethodChannel to listen for completion signal from Dart.
                val channel = io.flutter.plugin.common.MethodChannel(engine!!.dartExecutor.binaryMessenger, "tahafooz/bootstrap")
                val latch = java.util.concurrent.CountDownLatch(1)

                channel.setMethodCallHandler { call, _ ->
                    if (call.method == "rescheduleComplete") {
                        Log.i("Tahafooz", "Received rescheduleComplete from Dart")
                        latch.countDown()
                    }
                }

                // Wait for Dart to signal completion, but don't wait forever.
                val waited = latch.await(5, java.util.concurrent.TimeUnit.SECONDS)
                if (!waited) {
                    Log.w("Tahafooz", "RescheduleService: timeout waiting for Dart completion")
                }

                // After work, shut down the engine and stop service.
                try {
                    channel.setMethodCallHandler(null)
                } catch (_: Exception) {
                }
                engine?.destroy()
                engine = null
                stopSelf()
            } catch (e: Exception) {
                Log.e("Tahafooz", "Error starting headless engine: ${e.message}")
                stopSelf()
            }
        }.start()

        return START_NOT_STICKY
    }

    override fun onBind(intent: Intent?): IBinder? = null
}
