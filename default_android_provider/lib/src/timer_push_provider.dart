import 'dart:math';

import 'package:flutter/src/services/platform_channel.dart';
import 'package:push_provider/push_provider.dart';

class TimerPushProvider extends PushProvider{
  late EventChannel _eventChannel;
  TimerPushProvider(EventChannel channel) {
    _eventChannel = channel;
  }


  @override
  Stream<AblyCompatibleMessage> messageStream() {
    var random = new Random();
  return _eventChannel.receiveBroadcastStream().map((dynamic event) {
      //attend a randome event type temporarily, take from random index
      AblyCompatibleMessageType type = AblyCompatibleMessageType.values[random.nextInt(3)];
      return AblyCompatibleMessage(event,type);
    });

  }
}