import 'package:flutter/src/services/platform_channel.dart';
import 'package:push_provider/push_provider.dart';

class TimerPushProvider extends PushProvider{
  late EventChannel _eventChannel;
  TimerPushProvider(EventChannel channel) {
    _eventChannel = channel;
  }


  @override
  Stream<AblyCompatibleMessage> messageStream() {
    return _eventChannel.receiveBroadcastStream().map((dynamic event) {
      return AblyCompatibleMessage(event);
    });

  }
}