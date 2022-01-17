import 'dart:async';

import 'package:default_android_provider/src/timer_push_provider.dart';
import 'package:flutter/services.dart';
export 'package:default_android_provider/src/timer_push_provider.dart';
export 'src/timer_push_provider.dart';

class DefaultAndroidProvider {
  static const MethodChannel _channel =
      MethodChannel('default_android_provider');
  static const EventChannel _pushChannel =
      EventChannel('default_android_provider_event');

  static final TimerPushProvider timerPushProvider = TimerPushProvider(_pushChannel);

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

}
