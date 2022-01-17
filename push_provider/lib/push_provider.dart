library push_provider;
import 'ably_compatible_message.dart';
 export 'ably_compatible_message.dart';
/// A Calculator.
abstract class PushProvider {
  /// receive message
  Stream<AblyCompatibleMessage> messageStream();
}
