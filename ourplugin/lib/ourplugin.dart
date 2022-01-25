import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ourplugin/src/push_api.dart';
import 'package:push_provider/push_provider.dart';
export 'package:ourplugin/src/push_api.dart';
import 'package:async/async.dart' show StreamGroup;

class Ourplugin {
  List<PushProvider> _providers = [];

  Ourplugin.fromProviders(List<PushProvider> providers) {
    _providers = providers;
    _configureProviders();
  }

  Ourplugin.fromProvider(PushProvider provider) {
    this._providers.add(provider);
    _configureProviders();
  }

  late PushApi _pushApi;

  static const MethodChannel _channel = MethodChannel('ourplugin');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  //we should resolve messages and direct calls to PushApi

  void _configureProviders() {
    Stream<String> ablyStream = Stream.empty(); //this is a single stream
    List<Stream<AblyCompatibleMessage>> pluginStreams =
        List.empty(); //this is a streams from plugins, that will be grouped
    _providers.forEach((provider) {
      pluginStreams.add(provider.messageStream());
    });

    //now initialise api with all streams
    _pushApi = PushApi(ablyStream, StreamGroup.merge(pluginStreams));
  }
}
