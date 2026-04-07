import 'package:ausweisapp2_sdk/model/command.dart';

/// refer to: https://www.ausweisapp.bund.de/sdk/commands.html#run-auth
class RunAuth extends Command {
  RunAuth(String tcTokenURL, {Messages? messages})
      : super(CommandType.RUN_AUTH, {
          "cmd": "RUN_AUTH",
          "tcTokenURL": tcTokenURL,
          "messages": messages?.toJson(),
        });
}

/// refer to: https://www.ausweisapp.bund.de/sdk/commands.html#run-change-pin
class RunChangePin extends Command {
  RunChangePin({Messages? messages})
      : super(CommandType.RUN_CHANGE_PIN, {
          "cmd": "RUN_CHANGE_PIN",
          "messages": messages?.toJson(),
        });
}

/// Additional message config used in iOS system dialogs
/// Used by [RunAuth] and [RunChangePin] commands
class Messages {
  Messages(this.sessionStarted, this.sessionFailed, this.sessionSucceeded, this.sessionInProgress);

  final String sessionStarted;
  final String sessionFailed;
  final String sessionSucceeded;
  final String sessionInProgress;

  Map<String, dynamic> toJson() {
    return {
      "sessionStarted": sessionStarted,
      "sessionFailed": sessionFailed,
      "sessionSucceeded": sessionSucceeded,
      "sessionInProgress": sessionInProgress
    };
  }
}
