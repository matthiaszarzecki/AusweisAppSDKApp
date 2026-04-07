import 'package:ausweisapp2_sdk/model/command.dart';

/// refer to: https://www.ausweisapp.bund.de/sdk/commands.html#get-access-rights
class GetAccessRights extends Command {
  GetAccessRights()
      : super(CommandType.GET_ACCESS_RIGHTS, {
    "cmd": "GET_ACCESS_RIGHTS",
  });
}

/// refer to: https://www.ausweisapp.bund.de/sdk/commands.html#set-access-rights
class SetAccessRights extends Command {
  SetAccessRights(List<String> accessRights)
      : super(CommandType.SET_ACCESS_RIGHTS, {
    "cmd": "SET_ACCESS_RIGHTS",
    "chat": accessRights,
  });
}
