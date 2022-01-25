import 'package:flutter/cupertino.dart';
import 'package:push_provider/push_provider.dart';

class PushApi{
  Stream<String> pushStream;
  Stream<AblyCompatibleMessage> pluginStream;

  PushApi(this.pushStream, this.pluginStream){
    pushStream = pluginStream.map((acMessage) => 'Received ${acMessage.message}');
  }

}