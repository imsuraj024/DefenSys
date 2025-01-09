import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mobile_garuda_method_channel.dart';

abstract class MobileGarudaPlatform extends PlatformInterface {
  /// Constructs a MobileGarudaPlatform.
  MobileGarudaPlatform() : super(token: _token);

  static final Object _token = Object();

  static MobileGarudaPlatform _instance = MethodChannelMobileGaruda();

  /// The default instance of [MobileGarudaPlatform] to use.
  ///
  /// Defaults to [MethodChannelMobileGaruda].
  static MobileGarudaPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MobileGarudaPlatform] when
  /// they register themselves.
  static set instance(MobileGarudaPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool?> isDeviceSafe() {
    throw UnimplementedError('isDeviceSafe() has not been implemented.');
  }

  Future<bool?> isDeviceRooted() {
    throw UnimplementedError('isDeviceRooted() has not been implemented.');
  }

  Future<bool?> isDebuggingModeEnable() {
    throw UnimplementedError(
        'isDebuggingModeEnable() has not been implemented.');
  }

  Future<bool?> isDeveloperModeEnabled() {
    throw UnimplementedError(
        'isDeveloperModeEnabled() has not been implemented.');
  }

  Future<bool?> isEmulator() {
    throw UnimplementedError('isEmulator() has not been implemented.');
  }

  Future<bool?> isVpnEnabled() {
    throw UnimplementedError('isVpnEnabled() has not been implemented.');
  }

  Future<void> disableScreenshot() {
    throw UnimplementedError('disableScreenshot() has not been implemented.');
  }

  Future<void> enableScreenshot() {
    throw UnimplementedError('enableScreenshot() has not been implemented.');
  }

  Future<bool?> isDebuggerAttached() {
    throw UnimplementedError('isDebuggerAttached() has not been implemented.');
  }

  Future<bool?> isAppCloned(String applicationID) {
    throw UnimplementedError('isAppCloned() has not been implemented.');
  }
}
