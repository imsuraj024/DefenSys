import 'dart:developer';

import 'mobile_garuda_platform_interface.dart';

class MobileGaruda {
  Future<String?> getPlatformVersion() {
    return MobileGarudaPlatform.instance.getPlatformVersion();
  }

  Future<bool?> isDeviceRooted() {
    return MobileGarudaPlatform.instance.isDeviceRooted();
  }

  Future<bool?> isDeviceSafe() {
    return MobileGarudaPlatform.instance.isDeviceSafe();
  }

  Future<bool?> isDebuggingModeEnable() {
    return MobileGarudaPlatform.instance.isDebuggingModeEnable();
  }

  Future<bool?> isDeveloperModeEnabled() {
    return MobileGarudaPlatform.instance.isDeveloperModeEnabled();
  }

  Future<bool?> isEmulator() {
    return MobileGarudaPlatform.instance.isEmulator();
  }

  Future<bool?> isVpnEnabled() {
    return MobileGarudaPlatform.instance.isVpnEnabled();
  }

  Future<void> disableScreenshot() {
    return MobileGarudaPlatform.instance.disableScreenshot();
  }

  Future<void> enableScreenshot() {
    return MobileGarudaPlatform.instance.enableScreenshot();
  }

  Future<bool?> isDebuggerAttached() {
    return MobileGarudaPlatform.instance.isDebuggerAttached();
  }

  Future<bool?> isAppCloned() {
    log("Dart method app clone checker");
    return MobileGarudaPlatform.instance.isAppCloned();
  }
}
