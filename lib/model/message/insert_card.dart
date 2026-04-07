import 'package:ausweisapp2_sdk/model/message.dart';

/// refer to: https://www.ausweisapp.bund.de/sdk/messages.html#insert-card
class InsertCard extends Message {
  InsertCard(MessageType msg, Map<String, dynamic> json) : super(msg, json);

  factory InsertCard.fromJson(Map<String, dynamic> json) {
    return InsertCard(
      MessageType.INSERT_CARD,
      json,
    );
  }
}