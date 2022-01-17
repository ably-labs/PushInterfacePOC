import 'dart:async';

import 'package:default_android_provider/src/timer_push_provider.dart';
import 'package:flutter/services.dart';
import 'package:push_provider/ably_compatible_message.dart';
import 'package:push_provider/push_provider.dart';
export 'package:default_android_provider/src/timer_push_provider.dart';
export 'src/timer_push_provider.dart';

class DefaultAndroidProvider extends PushProvider{
  static const MethodChannel _channel =
      MethodChannel('default_android_provider');
  static const EventChannel _pushChannel =
      EventChannel('default_android_provider_event');

  static final TimerPushProvider _timerPushProvider = TimerPushProvider(_pushChannel);

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  @override
  Stream<AblyCompatibleMessage> messageStream() {
    return _timerPushProvider.messageStream();
  }

}
