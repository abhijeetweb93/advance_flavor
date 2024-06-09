package com.advanceflavor.advance_flavor

import android.content.Context
import android.os.Build
import android.provider.Settings
import android.telephony.TelephonyManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterFragmentActivity()  {


    private val CHANNEL = "flavor_channel"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getFlavor" -> {
                    result.success(BuildConfig.FLAVOR)
                }
                "getDeviceID" -> {
                    result.success(getDeviceId(this))
                }
                "getApplicationID"->{
                    result.success(getApplicationID(this))
                }
            }
        }
    }

}