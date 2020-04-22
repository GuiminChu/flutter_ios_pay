//
//  FlutterWXApiHandler.swift
//  flutter_ios_pay
//
//  Created by Guimin Chu on 2020/4/22.
//

import Foundation
import MonkeyKing

struct FlutterWXApiHandler {
    static func registerApp(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if isWeChatRegistered {
            result([Constants.Key.platform: Constants.Key.iOS, Constants.Key.result: true])
            return
        }
        
        let flutterError = FlutterError(code: "invalid app id", message: "are you sure your app id is correct ? ", details: nil)
        
        guard let arguments = call.arguments as? [String: Any] else {
            result(flutterError)
            return
        }
        
        guard let appId = arguments[Constants.Key.appId] as? String, !appId.isEmpty else {
            result(flutterError)
            return
        }
        
        let appKey = arguments[Constants.Key.appKey] as? String
        let miniAppId = arguments[Constants.Key.miniProgramId] as? String
        
        let account = MonkeyKing.Account.weChat(appID: appId, appKey: appKey, miniAppID: miniAppId)
        MonkeyKing.registerAccount(account)
        
        isWeChatRegistered = true
        
        result([Constants.Key.platform: Constants.Key.iOS, Constants.Key.result: isWeChatRegistered])
    }
}
