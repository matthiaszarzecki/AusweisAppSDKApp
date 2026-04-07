import 'dart:convert';

import 'package:ausweisapp2_sdk/model/command.dart';

/// refer to: https://www.ausweisapp.bund.de/sdk/commands.html#set-pin
class SetPIN extends Command {
  SetPIN(this.value)
      : super(CommandType.SET_PIN, {
          "cmd": "SET_PIN",
          "value": value,
        });

  final String value;

  /// Validated the set PIN to be exactly 6 numerical digits
  @override
  bool validate() {
    return (value.length == 6 || value.length == 5) && int.tryParse(value) != null;
  }

  /// Returns the command as `String`
  /// Contents of [value] will be obscured
  @override
  String toString() {
    final obscuredJson = Map.of(super.json);
    obscuredJson['value'] = 'xxxxxx';
    return jsonEncode(obscuredJson);
  }
}

/// refer to: https://www.ausweisapp.bund.de/sdk/commands.html#set-new-pin
class SetNewPIN extends Command {
  SetNewPIN(this.value)
      : super(CommandType.SET_NEW_PIN, {
          "cmd": "SET_NEW_PIN",
          "value": value,
        });

  final String value;

  /// Validated the set PIN to be exactly 6 numerical digits
  @override
  bool validate() {
    return value.length == 6 && int.tryParse(value) != null;
  }

  /// Returns the command as `String`
  /// Contents of [value] will be obscured
  @override
  String toString() {
    final obscuredJson = Map.of(super.json);
    obscuredJson['value'] = 'xxxxxx';
    return jsonEncode(obscuredJson);
  }
}

/// refer to: https://www.ausweisapp.bund.de/sdk/commands.html#set-can
class SetCAN extends Command {
  SetCAN(this.value)
      : super(CommandType.SET_CAN, {
          "cmd": "SET_CAN",
          "value": value,
        });

  final String value;

  /// Validated the set CAN to be exactly 6 numerical digits
  @override
  bool validate() {
    return value.length == 6 && int.tryParse(value) != null;
  }

  /// Returns the command as `String`
  /// Contents of [value] will be obscured
  @override
  String toString() {
    final obscuredJson = Map.of(super.json);
    obscuredJson['value'] = 'xxxxxx';
    return jsonEncode(obscuredJson);
  }
}

/// refer to: https://www.ausweisapp.bund.de/sdk/commands.html#set-puk
class SetPUK extends Command {
  SetPUK(this.value)
      : super(CommandType.SET_PUK, {
          "cmd": "SET_PUK",
          "value": value,
        });

  final String value;

  /// Validated the set PUK to be exactly 10 numerical digits
  @override
  bool validate() {
    return value.length == 10 && int.tryParse(value) != null;
  }

  /// Returns the command as `String`
  /// Contents of [value] will be obscured
  @override
  String toString() {
    final obscuredJson = Map.of(super.json);
    obscuredJson['value'] = 'xxxxxxxxxx';
    return jsonEncode(obscuredJson);
  }
}
