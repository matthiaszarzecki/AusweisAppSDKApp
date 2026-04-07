import 'package:ausweisapp2_sdk/model/message.dart';

/// refer to: https://www.ausweisapp.bund.de/sdk/messages.html#enter-pin
class EnterPIN extends Message {
  EnterPIN(MessageType msg, Map<String, dynamic> json, this.error, this.reader) : super(msg, json);

  factory EnterPIN.fromJson(Map<String, dynamic> json) {
    return EnterPIN(
      MessageType.ENTER_PIN,
      json,
      json['error'] as String?,
      Reader.fromJson(json['reader']),
    );
  }

  final String? error;
  final Reader reader;
}
