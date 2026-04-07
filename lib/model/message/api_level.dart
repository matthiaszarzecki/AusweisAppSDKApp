import 'package:ausweisapp2_sdk/model/message.dart';

/// refer to: https://www.ausweisapp.bund.de/sdk/messages.html#api-level
class ApiLevel extends Message {
  ApiLevel(
    MessageType msg,
    Map<String, dynamic> json,
    this.error,
    this.available,
    this.current,
  ) : super(msg, json);

  factory ApiLevel.fromJson(Map<String, dynamic> json) {
    return ApiLevel(
      MessageType.API_LEVEL,
      json,
      json['error'] as String?,
      (json['available'] as List).map((e) => e as int).toList(),
      json['current'] as int,
    );
  }

  final String? error;
  final List<int> available;
  final int current;
}
