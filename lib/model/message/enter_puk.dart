import 'package:ausweisapp2_sdk/model/message.dart';

/// refer to: https://www.ausweisapp.bund.de/sdk/messages.html#enter-puk
class EnterPUK extends Message {
  EnterPUK(MessageType msg, Map<String, dynamic> json, this.error, this.reader) : super(msg, json);

  factory EnterPUK.fromJson(Map<String, dynamic> json) {
    return EnterPUK(
      MessageType.ENTER_PUK,
      json,
      json['error'] as String?,
      Reader.fromJson(json['reader']),
    );
  }

  final String? error;
  final Reader reader;
}
