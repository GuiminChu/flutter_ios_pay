import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class FlutterIosPay {
  static const MethodChannel _methodChannel =
      const MethodChannel('flutter_ios_pay_method');

  Future<bool> isWeChatInstalled() async {
    return await _methodChannel.invokeMethod("isWeChatInstalled");
  }

  Future<bool> isAlipayInstalled() async {
    return await _methodChannel.invokeMethod("isAlipayInstalled");
  }

  Future register({String appId, enableMTA: false}) async {
    return await _methodChannel
        .invokeMethod("registerApp", {"appId": appId, "enableMTA": enableMTA});
  }

  static Future<bool> pay({
    @required String appId,
    @required String partnerId,
    @required String prepayId,
    @required String packageValue,
    @required String nonceStr,
    @required String timeStamp,
    @required String sign,
    String signType: "",
    String extData: "",
  }) async {
    return await _methodChannel.invokeMethod("order", {
      "appId": appId,
      "partnerId": partnerId,
      "prepayId": prepayId,
      "packageValue": packageValue,
      "nonceStr": nonceStr,
      "timeStamp": timeStamp,
      "sign": sign,
      "signType": signType,
      "extData": extData,
    });
  }
}
