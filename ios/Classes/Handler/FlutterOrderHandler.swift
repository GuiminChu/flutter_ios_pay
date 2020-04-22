//
//  FlutterWXApiHandler.swift
//  flutter_ios_pay
//
//  Created by Guimin Chu on 2020/4/22.
//

import Foundation
import MonkeyKing

struct FlutterOrderHandler {
    static func handleOrder(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let arguments = call.arguments as? [String: String] else {
            return
        }
        
        let appId = arguments["appId"]!
        let timestamp = arguments["timeStamp"]!
        let partnerId = arguments["partnerId"]!
        let prepayId = arguments["prepayId"]!
        let packageValue = arguments["packageValue"]!
        let nonceStr = arguments["nonceStr"]!
        let sign = arguments["sign"]!
        
        let orderString = "weixin://app/\(appId)/pay/?nonceStr=\(nonceStr)&package=\(packageValue)&partnerId=\(partnerId)&prepayId=\(prepayId)&timeStamp=\(timestamp)&sign=\(sign)&signType=SHA1"

        let urlString = orderString.replacingOccurrences(of: "Sign=WXPay", with: "Sign%3DWXPay")
        
        MonkeyKing.deliver(MonkeyKing.Order.weChat(urlString: urlString)) { (done) in
            result(done)
            if (done) {
                print("支付成功")
            } else {
                print("取消支付")
            }
        }
    }
}
