import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_garuda/mobile_garuda.dart';
import 'package:mobile_garuda/mobile_garuda_platform_interface.dart';
import 'package:mobile_garuda/mobile_garuda_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMobileGarudaPlatform
    with MockPlatformInterfaceMixin
    implements MobileGarudaPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool?> isDeviceRooted() {
    // TODO: implement isDeviceRooted
    throw UnimplementedError();
  }

  @override
  Future<bool?> isDeveloperModeEnabled() {
    // TODO: implement isDeveloperModeEnabled
    throw UnimplementedError();
  }

  @override
  Future<bool?> isDeviceSafe() {
    // TODO: implement isDeviceSafe
    throw UnimplementedError();
  }

  @override
  Future<bool?> isDebuggingModeEnable() {
    // TODO: implement isDebuggingModeEnable
    throw UnimplementedError();
  }

  @override
  Future<bool?> isEmulator() {
    // TODO: implement isEmulator
    throw UnimplementedError();
  }

  @override
  Future<bool?> isVpnEnabled() {
    // TODO: implement isVpnEnabled
    throw UnimplementedError();
  }

  @override
  Future<void> disableScreenshot() {
    // TODO: implement preventScreenshotsGlobally
    throw UnimplementedError();
  }

  @override
  Future<void> enableScreenshot() {
    // TODO: implement preventScreenshotsGlobally
    throw UnimplementedError();
  }

  @override
  Future<bool?> isDebuggerAttached() {
    // TODO: implement isDebuggerAttached
    throw UnimplementedError();
  }

  @override
  Future<bool?> isAppCloned(String applicationID) {
    // TODO: implement isAppCloned
    throw UnimplementedError();
  }
}

void main() {
  final MobileGarudaPlatform initialPlatform = MobileGarudaPlatform.instance;

  test('$MethodChannelMobileGaruda is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMobileGaruda>());
  });

  test('getPlatformVersion', () async {
    MobileGaruda mobileGarudaPlugin = MobileGaruda();
    MockMobileGarudaPlatform fakePlatform = MockMobileGarudaPlatform();
    MobileGarudaPlatform.instance = fakePlatform;

    expect(await mobileGarudaPlugin.getPlatformVersion(), '42');
  });
}
