//
//  FlutterWXApiHandler.swift
//  flutter_ios_pay
//
//  Created by Guimin Chu on 2020/4/22.
//

import Foundation

public struct FlutterMethodCallHandler {
    public static func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let callMethod = call.method
        print("callMethod: " + callMethod)
        if "registerApp" == callMethod {
            FlutterWXApiHandler.registerApp(call, result: result)
        } else if "isWeChatInstalled" == callMethod {
            FlutterHelpHandler.isWeChatInstalled(call, result: result)
        } else if "isAlipayInstalled" == callMethod {
            FlutterHelpHandler.isAlipayInstalled(call, result: result)
        } else if "order" == callMethod {
            FlutterOrderHandler.handleOrder(call, result: result)
        }
    }
}
