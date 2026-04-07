import 'package:ausweisapp2_sdk/model/message.dart';

/// refer to: https://www.ausweisapp.bund.de/sdk/messages.html#enter-new-pin
class EnterNewPIN extends Message {
  EnterNewPIN(MessageType msg, Map<String, dynamic> json, this.error, this.reader) : super(msg, json);

  factory EnterNewPIN.fromJson(Map<String, dynamic> json) {
    return EnterNewPIN(
      MessageType.ENTER_NEW_PIN,
      json,
      json['error'] as String?,
      Reader.fromJson(json['reader']),
    );
  }

  final String? error;
  final Reader reader;
}
