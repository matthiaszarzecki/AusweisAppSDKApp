import 'dart:convert';

export 'message.dart';
export 'message/access_rights.dart';
export 'message/api_level.dart';
export 'message/auth.dart';
export 'message/certificate.dart';
export 'message/change_pin.dart';
export 'message/enter_can.dart';
export 'message/enter_new_pin.dart';
export 'message/enter_pin.dart';
export 'message/enter_puk.dart';
export 'message/error.dart';
export 'message/info.dart';
export 'message/insert_card.dart';
export 'message/reader.dart';
export 'message/status.dart';

/// List of all possible types of messages sent by AusweisApp2
/// for more information refer to: https://www.ausweisapp.bund.de/sdk/messages.html
enum MessageType {
  ACCESS_RIGHTS,
  API_LEVEL,
  AUTH,
  BAD_STATE,
  CERTIFICATE,
  CHANGE_PIN,
  ENTER_CAN,
  ENTER_PIN,
  ENTER_NEW_PIN,
  ENTER_PUK,
  INFO,
  INSERT_CARD,
  INTERNAL_ERROR,
  INVALID,
  READER,
  READER_LIST,
  UNKNOWN_COMMAND,
  STATUS,
}

abstract class Message {
  Message(this.msg, this.json);

  /// Type this message has
  final MessageType msg;

  /// Json object the message object was create from
  final Map<String, dynamic> json;

  @override
  String toString() {
    return jsonEncode(json);
  }
}
