//
//  FlutterHelpHandler.swift
//  flutter_ios_pay
//
//  Created by Guimin Chu on 2019/5/6.
//

import Foundation
import MonkeyKing

struct FlutterHelpHandler {
    static func isWeChatInstalled(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(MonkeyKing.SupportedPlatform.weChat.isAppInstalled)
    }
    
    static func isAlipayInstalled(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(MonkeyKing.SupportedPlatform.alipay.isAppInstalled)
    }
    
}
