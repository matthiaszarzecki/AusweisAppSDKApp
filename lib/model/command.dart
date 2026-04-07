export 'command/access_rights.dart';
export 'command/api_level.dart';
export 'command/get_reader.dart';
export 'command/info.dart';
export 'command/run.dart';
export 'command/set_pin_puk.dart';

import 'dart:convert';

/// List of all accepted types of commands sendable to AusweisApp2
/// for more information refer to: https://www.ausweisapp.bund.de/sdk/commands.html
enum CommandType {
  GET_INFO,
  GET_API_LEVEL,
  SET_API_LEVEL,
  GET_READER,
  GET_READER_LIST,
  RUN_AUTH,
  RUN_CHANGE_PIN,
  GET_ACCESS_RIGHTS,
  SET_ACCESS_RIGHTS,
  GET_CERTIFICATE,
  CANCEL,
  ACCEPT,
  INTERRUPT,
  SET_PIN,
  SET_NEW_PIN,
  SET_CAN,
  SET_PUK,
}


abstract class Command {
  Command(this.cmd, this.json);

  /// Type this command has
  final CommandType cmd;

  /// Json object the command object was create from
  final Map<String, dynamic> json;

  /// Returns the command as a encoded Json `String`
  String toJson() {
    return jsonEncode(json);
  }

  /// Valdator for values contained in the command
  /// Defaults to `true` as not every command requires validation of data
  /// Returns `true` if validation successful otherwise `false`
  bool validate() {
    return true;
  }

  /// Returns the command as `String`
  /// Mainly used for logging
  @override
  String toString() {
    return jsonEncode(json);
  }
}
