import 'package:ausweisapp2_sdk/model/message.dart';

/// refer to: https://www.ausweisapp.bund.de/sdk/messages.html#insert-card
class Status extends Message {
  Status(MessageType msg, this.progress, this.workflow, this.state, Map<String, dynamic> json) : super(msg, json);

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      MessageType.STATUS,
      json['progress'] as int?,
      json['workflow'] as String?,
      json['state'] as String?,
      json,
    );
  }

  final int? progress;
  final String? workflow;
  final String? state;
}
