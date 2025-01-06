import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_garuda/mobile_garuda.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  bool _isDeviceSafe = false,
      _isDebuggingModeEnable = false,
      _isDeveloperModeEnabled = false,
      _isVpnEnabled = false,
      _isScreenshotDisabled = false,
      _isDebuggerAttached = false,
      _copyPasteEnable = false,
      _isAppCloned = false;
  bool? _isDeviceRooted, _isEmulator;

  final _mobileGarudaPlugin = MobileGaruda();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    bool isDeviceSafe,
        isDebuggingModeEnable,
        isDeveloperModeEnabled,
        isVpnEnabled;
    bool? isDeviceRooted, isEmulator;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _mobileGarudaPlugin.getPlatformVersion() ??
          'Unknown platform version';
      isDeviceRooted = await _mobileGarudaPlugin.isDeviceRooted();
      isDeviceSafe = await _mobileGarudaPlugin.isDeviceSafe() ?? false;
      isDebuggingModeEnable =
          await _mobileGarudaPlugin.isDebuggingModeEnable() ?? false;
      isDeveloperModeEnabled =
          await _mobileGarudaPlugin.isDeveloperModeEnabled() ?? false;
      isEmulator = await _mobileGarudaPlugin.isEmulator();
      isVpnEnabled = await _mobileGarudaPlugin.isVpnEnabled() ?? false;
      _isDebuggerAttached =
          await _mobileGarudaPlugin.isDebuggerAttached() ?? false;
      _isAppCloned = await _mobileGarudaPlugin.isAppCloned() ?? false;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
      isDeviceRooted = false;
      isDeviceSafe = true;
      isDebuggingModeEnable = false;
      isDeveloperModeEnabled = false;
      isEmulator = false;
      isVpnEnabled = false;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _isDeviceRooted = isDeviceRooted;
      _isDeviceSafe = isDeviceSafe;
      _isDebuggingModeEnable = isDebuggingModeEnable;
      _isDeveloperModeEnabled = isDeveloperModeEnabled;
      _isEmulator = isEmulator;
      _isVpnEnabled = isVpnEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mobile Gradua Plugin'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Running on: $_platformVersion\n'),
                Text('Is Device Safe: $_isDeviceSafe\n'),
                const Divider(),
                const Text(
                  'Checklist',
                  textAlign: TextAlign.center,
                ),
                const Divider(),
                Text('Is Device Rooted: ${_isDeviceRooted ?? "Unknown"}'),
                Text('Is Debugging Mode Enable: $_isDebuggingModeEnable'),
                Text('Is Developer Mode Enabled: $_isDeveloperModeEnabled'),
                Text('Is Emulator: ${_isEmulator ?? "Unknown"}'),
                Text('Is VPN Enabled: $_isVpnEnabled'),
                Text('Is Screenshot Disabled: $_isScreenshotDisabled'),
                Text('Is Debugger Attached: $_isDebuggerAttached'),
                Text('Is App Cloned: $_isAppCloned'),
                Text('Is Copy paste Enabled: $_copyPasteEnable'),
                const Divider(),
                ListTile(
                  title: const Text("Copy Paste"),
                  subtitle: _copyPasteEnable
                      ? const Text("Enabled")
                      : const Text("Disabled"),
                  trailing: Switch.adaptive(
                      value: _copyPasteEnable,
                      onChanged: (value) {
                        _copyPasteEnable = !_copyPasteEnable;
                        setState(() {});
                      }),
                ),
                SizedBox(
                  height: 80,
                  child: TextField(
                    decoration: const InputDecoration(
                      label: Text("TextField"),
                      border: OutlineInputBorder(),
                    ),
                    enableInteractiveSelection: _copyPasteEnable,
                    contextMenuBuilder: _copyPasteEnable
                        ? (context, editableTextState) {
                            final buttonItems =
                                editableTextState.contextMenuButtonItems;
                            return AdaptiveTextSelectionToolbar.buttonItems(
                              anchors: editableTextState.contextMenuAnchors,
                              buttonItems: buttonItems,
                            );
                          }
                        : null,
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text("TextFormField"),
                      border: OutlineInputBorder(),
                    ),
                    enableInteractiveSelection: _copyPasteEnable,
                    contextMenuBuilder: _copyPasteEnable
                        ? (context, editableTextState) {
                            final buttonItems =
                                editableTextState.contextMenuButtonItems;
                            return AdaptiveTextSelectionToolbar.buttonItems(
                              anchors: editableTextState.contextMenuAnchors,
                              buttonItems: buttonItems,
                            );
                          }
                        : null,
                  ),
                ),
                ListTile(
                  title: const Text("Screen Capturing and Screensharing"),
                  subtitle: !_isScreenshotDisabled
                      ? const Text("Allowed")
                      : const Text("Restricted"),
                  trailing: Switch.adaptive(
                      value: !_isScreenshotDisabled,
                      onChanged: (value) {
                        if (_isScreenshotDisabled) {
                          _mobileGarudaPlugin.enableScreenshot();
                        } else {
                          _mobileGarudaPlugin.disableScreenshot();
                        }
                        _isScreenshotDisabled = !_isScreenshotDisabled;
                        setState(() {});
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
