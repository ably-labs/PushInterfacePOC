library push_provider;

/// A Calculator.
abstract class PushProvider {
  /// receive message
  void receive(String message);
}
