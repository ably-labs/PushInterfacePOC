import 'dart:async';

import 'package:flutter/services.dart';
import 'package:ourplugin/src/push_api.dart';
import 'package:push_provider/push_provider.dart';
export 'package:ourplugin/src/push_api.dart';
import 'package:async/async.dart' show StreamGroup;

class Ourplugin {
  //create a singleton
   Ourplugin() {}

  List<PushProvider> _providers = [];

  Ourplugin.fromProviders(List<PushProvider> providers) {
     _providers = providers;
    _configureProviders();
  }

  Ourplugin.fromProvider(PushProvider provider) {
     _providers.add(provider);
     _configureProviders();
  }

  late PushApi pushApi;

  static const MethodChannel _channel = MethodChannel('ourplugin');


  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  //we should resolve messages and direct calls to PushApi

  void _configureProviders() {
    Stream<String> ablyStream = const Stream.empty(); //this is a single stream
    List<Stream<AblyCompatibleMessage>> pluginStreams =
        List.generate(_providers.length, (index) => _providers[index].messageStream()); //this is a streams from plugins, that will be grouped
    //now initialise api with all streams
    pushApi = PushApi(ablyStream, StreamGroup.merge(pluginStreams));
   /* pushApi.pushStream.listen((event) {
      print("event: $event");
    });*/
  }
}
