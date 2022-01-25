import 'package:flutter/cupertino.dart';
import 'package:push_provider/push_provider.dart';

class PushApi{
  Stream<String> pushStream;
  Stream<AblyCompatibleMessage> pluginStream;

  PushApi(this.pushStream, this.pluginStream){
    pushStream = pluginStream.map((acMessage) => 'Received ${acMessage.message}');
  }
  Stream<String> processStream(Stream<AblyCompatibleMessage> stream){
    //this map function would act as a transformer between the stream of
    // messages and the stream of a more compalicated type
    return stream.map((acMessage) => acMessage.message);
  }

}