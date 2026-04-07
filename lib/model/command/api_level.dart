import 'package:ausweisapp2_sdk/model/command.dart';

/// refer to: https://www.ausweisapp.bund.de/sdk/commands.html#get-api-level
class GetApiLevel extends Command {
  GetApiLevel() : super(CommandType.GET_API_LEVEL, {
    "cmd": "GET_API_LEVEL"
  });
}

/// refer to: https://www.ausweisapp.bund.de/sdk/commands.html#set-api-level
class SetApiLevel extends Command {
  SetApiLevel(int apiLevel) : super(CommandType.SET_API_LEVEL, {
    "cmd": "SET_API_LEVEL",
    "level": apiLevel,
  });
}