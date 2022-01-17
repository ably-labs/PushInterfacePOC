import 'package:push_provider/push_provider.dart';

class TimerPushProvider extends PushProvider{
  @override
  void receive(String message) {
    print('Message received from Android plugin: $message');
  }
}