class AblyCompatibleMessage{
 //this would normally be in message, will leave here for quick demo
  AblyCompatibleMessageType type;
  String message;
  AblyCompatibleMessage(this.message,this.type);
}
enum AblyCompatibleMessageType {
  Activate,
  Deactivate,
  MessageReceived
}