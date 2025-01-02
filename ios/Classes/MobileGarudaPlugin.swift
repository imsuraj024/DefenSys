import Flutter
import UIKit
import DTTJailbreakDetection

public class MobileGarudaPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "mobile_garuda", binaryMessenger: registrar.messenger())
    let instance = MobileGarudaPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
     case "isDeviceRooted":
            result(isJailBroken())
            break
     case "isDeviceSafe":
            result(false)
            break
      case "isDebuggingModeEnable":
            result(false)
            break
      case  "isDeveloperModeEnabled":
            result(false)
            break
      case "isEmulator":
            result(isSimulator())
            break
      case "enableScreenshot":
            result(false)
            break
      case "disableScreenshot":
            result(false)
            break
      case "isDebuggerAttached":
            result(false)
            break
      case "isAppCloned":
            result(false)
            break
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func isSimulator() -> Bool {
         #if targetEnvironment(simulator)
             return true
         #else
            return false
         #endif
    }

   private func isJailBroken() -> Bool {
        return DTTJailbreakDetection.isJailbroken()
    }
}
