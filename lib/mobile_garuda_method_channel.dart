import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mobile_garuda/mobile_garuda_constant.dart';

import 'mobile_garuda_platform_interface.dart';

/// An implementation of [MobileGarudaPlatform] that uses method channels.
class MethodChannelMobileGaruda extends MobileGarudaPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mobile_garuda');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> isDeviceRooted() async {
    final rooted = await methodChannel.invokeMethod<bool>('isDeviceRooted');
    return rooted;
  }

  @override
  Future<bool?> isDeviceSafe() async {
    final safe = await methodChannel.invokeMethod<bool>('isDeviceSafe');
    return safe;
  }

  @override
  Future<bool?> isDebuggingModeEnable() async {
    final usbDebug =
        await methodChannel.invokeMethod<bool>('isDebuggingModeEnable');
    return usbDebug;
  }

  @override
  Future<bool?> isDeveloperModeEnabled() async {
    final developerMode =
        await methodChannel.invokeMethod<bool>('isDeveloperModeEnabled');
    return developerMode;
  }

  @override
  Future<bool?> isEmulator() async {
    final emulator = await methodChannel.invokeMethod<bool>('isEmulator');
    return emulator;
  }

  @override
  Future<bool?> isVpnEnabled() async {
    try {
      final interfaces = await NetworkInterface.list();

      return interfaces.any(
        (interface) {
          return commonVpnInterfaceNamePatterns.any(
            (pattern) {
              if (Platform.isIOS &&
                  (interface.name.toLowerCase().contains('ipsec') ||
                      interface.name.toLowerCase().contains('utun6') ||
                      interface.name.toLowerCase().contains('ikev2') ||
                      interface.name.toLowerCase().contains('l2tp'))) {
                return false;
              }
              return interface.name.toLowerCase().contains(pattern);
            },
          );
        },
      );
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> disableScreenshot() async {
    await methodChannel.invokeMethod<void>('disableScreenshot');
  }

  @override
  Future<void> enableScreenshot() async {
    await methodChannel.invokeMethod<void>('enableScreenshot');
  }

  @override
  Future<bool?> isDebuggerAttached() async {
    final rooted = await methodChannel.invokeMethod<bool>('isDebuggerAttached');
    return rooted;
  }

  @override
  Future<bool?> isAppCloned(String applicationID) async {
    final rooted = await methodChannel.invokeMethod<bool>('isAppCloned', {
      "applicationID": applicationID,
    });
    return rooted;
  }
}
