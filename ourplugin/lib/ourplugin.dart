
import 'dart:async';

import 'package:flutter/services.dart';
export 'package:ourplugin/src/push_api.dart';

class Ourplugin {
  static const MethodChannel _channel = MethodChannel('ourplugin');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

}
