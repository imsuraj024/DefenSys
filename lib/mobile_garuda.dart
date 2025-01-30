import 'mobile_garuda_platform_interface.dart';

class MobileGaruda {
  /// Gets the current platform version.
  ///
  /// Returns a string representing the platform version if successful, otherwise
  /// returns null.
  Future<String?> getPlatformVersion() {
    return MobileGarudaPlatform.instance.getPlatformVersion();
  }

  /// Checks if the device is Rooted for Android
  /// Checks if the device is Jailbroken for iOS
  /// Returns a boolean indicating whether the device is rooted/jailbroken.
  /// If the platform does not support this operation, it returns null.
  Future<bool?> isDeviceRooted() {
    return MobileGarudaPlatform.instance.isDeviceRooted();
  }

  /// Checks if the device is safe for your app to run on.
  ///
  /// It checks for [isDeviceRooted/jailbroken]  devices,
  /// whether the app is running in [isDebuggingModeEnable],
  /// check whether [isDeveloperModeEnabled]on device,
  /// whether the App is running on [isEmulator],
  /// [isVpnEnabled],
  /// and whether the app is cloned.
  /// Returns a boolean after evaluatng all these scenarios to determine whether the device is safe for your app to run on.
  /// If the platform does not support this operation, it returns null.
  Future<bool?> isDeviceSafe() {
    return MobileGarudaPlatform.instance.isDeviceSafe();
  }

  /// Checks if the device is in debugging mode.
  ///
  /// Returns a boolean indicating whether debugging mode is enabled.
  /// If the platform does not support this operation, it returns null.
  Future<bool?> isDebuggingModeEnable() {
    return MobileGarudaPlatform.instance.isDebuggingModeEnable();
  }

  /// Checks if the device developer mode (Only works on Android)
  ///
  /// Returns a boolean indicating whether developer mode is enabled.
  /// If the platform does not support this operation, it returns null.
  Future<bool?> isDeveloperModeEnabled() {
    return MobileGarudaPlatform.instance.isDeveloperModeEnabled();
  }

  /// Checks if the device is an emulator.
  ///
  /// Returns a boolean indicating whether the device is an emulator.
  /// If the platform does not support this operation, it returns null.
  Future<bool?> isEmulator() {
    return MobileGarudaPlatform.instance.isEmulator();
  }

  /// Checks if a VPN is enabled.
  ///
  /// Returns a boolean indicating whether a VPN is enabled.
  /// If the platform does not support this operation, it returns null.
  Future<bool?> isVpnEnabled() {
    return MobileGarudaPlatform.instance.isVpnEnabled();
  }

  /// Disables the ability to take a screenshot / screenrecording or screen sharing on the device.
  ///
  /// This will set the [WindowManager.LayoutParams.FLAG_SECURE] flag on the
  /// current activity, which will prevent the device from taking a screenshot.
  ///
  /// It uses [ScreenProtectorKit] to disable the screenshot on iOS
  ///
  /// Note that this is a best effort and may not work on all devices or platforms.
  Future<void> disableScreenshot() {
    return MobileGarudaPlatform.instance.disableScreenshot();
  }

  /// Allows to takes screenshots / screenrecording or screen sharing
  ///
  /// This will clear [WindowManager.LayoutParams.FLAG_SECURE] flag on the
  /// current activity, which will allow the device to take screenshot/ screenrecording or screen sharing.
  ///
  /// It uses [ScreenProtectorKit] to enable the screenshot on iOS
  ///
  /// Note that this is a best effort and may not work on all devices or platforms.
  Future<void> enableScreenshot() {
    return MobileGarudaPlatform.instance.enableScreenshot();
  }

  /// Checks if the device has a debugger attached.
  ///
  /// Returns a boolean indicating whether the device has a debugger attached.
  /// If the platform does not support this operation, it returns null.
  Future<bool?> isDebuggerAttached() {
    return MobileGarudaPlatform.instance.isDebuggerAttached();
  }

  /// Checks if the app is cloned. (Only works on Android)
  ///
  /// This function evaluates whether the application is running as a cloned app
  /// by using the provided application ID.
  ///
  /// Returns a boolean indicating whether the app is cloned. If the platform does
  /// not support this operation, it returns null.
  Future<bool?> isAppCloned({required String applicationID}) {
    return MobileGarudaPlatform.instance.isAppCloned(applicationID);
  }
}
