import 'package:ausweisapp2_sdk/ausweisapp2_sdk.dart';

/// refer to: https://www.ausweisapp.bund.de/sdk/messages.html#reader-list
class ReaderList extends Message {
  ReaderList(MessageType messageType, Map<String, dynamic> json, this.reader) : super(messageType, json);

  factory ReaderList.fromJson(Map<String, dynamic> json) {
    return ReaderList(
      MessageType.READER_LIST,
      json,
      (json['reader'] as List).map((e) => Reader.fromJson(e)).toList(),
    );
  }

  final List<Reader> reader;
}

/// refer to: https://www.ausweisapp.bund.de/sdk/messages.html#reader
class Reader extends Message {
  Reader(
    MessageType messageType,
    Map<String, dynamic> json,
    this.name,
    this.attached,
    this.keypad,
    this.card,
  ) : super(messageType, json);

  factory Reader.fromJson(Map<String, dynamic> json) {
    return Reader(
      MessageType.READER,
      json,
      json['name'] as String,
      json['attached'] as bool,
      json['keypad'] as bool?,
      json['card'] == null ? null : Card.fromJson(json['card']),
    );
  }

  final String name;
  final bool attached;
  final bool? keypad;
  final Card? card;
}

class Card {
  Card(this.inoperative, this.deactivated, this.retryCounter);

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      json['inoperative'] as bool,
      json['deactivated'] as bool,
      json['retryCounter'] as int,
    );
  }

  final bool inoperative;
  final bool deactivated;
  final int retryCounter;
}
