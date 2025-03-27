package com.mobileapp.garuda.mobile_garuda

import android.os.Build
import android.app.Activity
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import android.provider.Settings
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

/** MobileGarudaPlugin */
class MobileGarudaPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: android.content.Context
  private var activity: Activity? = null



  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "mobile_garuda")
    context = flutterPluginBinding.applicationContext
    channel.setMethodCallHandler(this)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
      activity = binding.activity
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
      activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {}

  override fun onDetachedFromActivity() {}

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${Build.VERSION.RELEASE}")
    } else if (call.method == "isDeviceSafe") {
      result.success(isDeviceSafe(call))
    } else if (call.method == "isDeviceRooted") {
      result.success(RootCheck(context).isRooted())
    } else if (call.method == "isDeveloperModeEnabled") {
      result.success(isDeveloperModeEnabled())
    } else if (call.method == "isDebuggingModeEnable") {
      result.success(DebuggingModeCheck(context).isDebuggingModeEnabled())
    } else if (call.method == "isEmulator") {
      result.success(EmulatorCheck().isEmulator())
    } else if (call.method == "enableScreenshot") {
      result.success(ScreenshotProtection(activity).turnScreenshotOn())
    } else if (call.method == "disableScreenshot") {
      result.success(ScreenshotProtection(activity).turnScreenshotOff())
    } else if (call.method == "isDebuggerAttached") {
      result.success(DebuggerProtection().isDebuggerAttached())
    }  else if (call.method == "isAppCloned") {
      result.success(AppCloneChecker(call, activity).appCloneChecker())
    } else {
      result.notImplemented()
    }
  }

    fun isDeviceSafe(call: MethodCall): Boolean {
        return !RootCheck(context).isRooted() &&
                !isDeveloperModeEnabled() &&
                !DebuggingModeCheck(context).isDebuggingModeEnabled() &&
                !EmulatorCheck().isEmulator() &&
                !DebuggerProtection().isDebuggerAttached() &&
                !AppCloneChecker(call, activity).appCloneChecker()
    }

    fun isDeveloperModeEnabled(): Boolean {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            return Settings.Secure.getInt(
                context.contentResolver,
                Settings.Global.DEVELOPMENT_SETTINGS_ENABLED, 0
            ) != 0
        } else {
            return false;
        }
    }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
