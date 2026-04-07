import 'package:ausweisapp2_sdk/model/message.dart';

/// refer to: https://www.ausweisapp.bund.de/sdk/messages.html#enter-can
class EnterCAN extends Message {
  EnterCAN(MessageType msg, Map<String, dynamic> json, this.error, this.reader) : super(msg, json);

  factory EnterCAN.fromJson(Map<String, dynamic> json) {
    return EnterCAN(
      MessageType.ENTER_CAN,
      json,
      json['error'] as String?,
      Reader.fromJson(json['reader']),
    );
  }

  final String? error;
  final Reader reader;
}
