import 'package:ausweisapp2_sdk/model/message.dart';

/// refer to: https://www.ausweisapp.bund.de/sdk/messages.html#auth
class Auth extends Message {
  Auth(
    MessageType msg,
    Map<String, dynamic> json,
    this.error,
    this.result,
    this.url,
  ) : super(msg, json);

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      MessageType.AUTH,
      json,
      json['error'] as String?,
      json['result'] == null ? null : Result.fromJson(json['result']),
      json['url'] as String?,
    );
  }

  final String? error;
  final Result? result;
  final String? url;
}

class Result {
  Result(this.major, this.minor, this.language, this.description, this.message);

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      json['major'] as String?,
      json['minor'] as String?,
      json['language'] as String?,
      json['description'] as String?,
      json['message'] as String?,
    );
  }

  final String? major;
  final String? minor;
  final String? language;
  final String? description;
  final String? message;
}
