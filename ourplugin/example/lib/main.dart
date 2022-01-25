import 'package:flutter/material.dart';
import 'dart:async';

import 'package:ourplugin/ourplugin.dart';
import 'package:default_android_provider/default_android_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Ourplugin _ourplugin;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    _ourplugin = Ourplugin.fromProvider(DefaultAndroidProvider());
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child:  StreamBuilder(
              stream: _ourplugin.pushApi.pushStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  String message =  snapshot.data as String;
                  return Text(
                    message,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  );
                }
                return Text(
                  "No push message",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                );
              },
            )

        ),
      ),
    );
  }

}
