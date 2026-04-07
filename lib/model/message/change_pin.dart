import 'package:ausweisapp2_sdk/model/message.dart';

/// refer to: https://www.ausweisapp.bund.de/sdk/messages.html#change-pin
class ChangePin extends Message {
  ChangePin(MessageType msg, Map<String, dynamic> json, this.success) : super(msg, json);

  factory ChangePin.fromJson(Map<String, dynamic> json) {
    return ChangePin(
      MessageType.CHANGE_PIN,
      json,
      json['success'] as bool?,
    );
  }

  final bool? success;
}
