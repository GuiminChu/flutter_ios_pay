import Flutter
import UIKit

var isWeChatRegistered = false

public class SwiftFlutterIosPayPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_ios_pay", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterIosPayPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        FlutterMethodCallHandler.handle(call, result: result)
    }
}
