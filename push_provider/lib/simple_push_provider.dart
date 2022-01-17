library push_provider;
import 'push_provider.dart';

/// A Calculator.
 class SimplePushProvider extends PushProvider {
  /// receive message
   @override
  void receive(String message) {
     print(message);
  }
}
