import 'package:ausweisapp2_sdk/model/message.dart';

/// refer to: https://www.ausweisapp.bund.de/sdk/messages.html#bad-state
class BadState extends Message {
  BadState(MessageType msg, Map<String, dynamic> json, this.error) : super(msg, json);

  factory BadState.fromJson(Map<String, dynamic> json) {
    return BadState(
      MessageType.BAD_STATE,
      json,
      json['error'] as String,
    );
  }

  final String error;
}

/// refer to: https://www.ausweisapp.bund.de/sdk/messages.html#internal-error
class InternalError extends Message {
  InternalError(MessageType msg, Map<String, dynamic> json, this.error) : super(msg, json);

  factory InternalError.fromJson(Map<String, dynamic> json) {
    return InternalError(
      MessageType.INTERNAL_ERROR,
      json,
      json['error'] as String?,
    );
  }

  final String? error;
}

/// refer to: https://www.ausweisapp.bund.de/sdk/messages.html#invalid
class Invalid extends Message {
  Invalid(MessageType msg, Map<String, dynamic> json, this.error) : super(msg, json);

  factory Invalid.fromJson(Map<String, dynamic> json) {
    return Invalid(
      MessageType.INVALID,
      json,
      json['error'] as String,
    );
  }

  final String error;
}

/// refer to: https://www.ausweisapp.bund.de/sdk/messages.html#unknown-command
class UnknownCommand extends Message {
  UnknownCommand(MessageType msg, Map<String, dynamic> json, this.error) : super(msg, json);

  factory UnknownCommand.fromJson(Map<String, dynamic> json) {
    return UnknownCommand(
      MessageType.UNKNOWN_COMMAND,
      json,
      json['error'] as String,
    );
  }

  final String error;
}
