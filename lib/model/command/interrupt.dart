import 'package:ausweisapp2_sdk/ausweisapp2_sdk.dart';

/// refer to: https://www.ausweisapp.bund.de/sdk/commands.html#interrupt
class Interrupt extends Command {
  Interrupt()
      : super(CommandType.INTERRUPT, {
          "cmd": "INTERRUPT",
        });
}
