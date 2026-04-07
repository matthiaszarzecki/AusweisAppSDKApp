import 'package:ausweisapp2_sdk/model/command.dart';

/// refer to: https://www.ausweisapp.bund.de/sdk/commands.html#get-info
class GetInfo extends Command {
  GetInfo() : super(CommandType.GET_INFO, {"cmd": "GET_INFO"});
}

/// refer to: https://www.ausweisapp.bund.de/sdk/commands.html#get-certificate
class GetCertificate extends Command {
  GetCertificate() : super(CommandType.GET_CERTIFICATE, {"cmd": "GET_CERTIFICATE"});
}

/// refer to: https://www.ausweisapp.bund.de/sdk/commands.html#cancel
class Cancel extends Command {
  Cancel() : super(CommandType.CANCEL, {"cmd": "CANCEL"});
}

/// refer to: https://www.ausweisapp.bund.de/sdk/commands.html#accept
class Accept extends Command {
  Accept() : super(CommandType.ACCEPT, {"cmd": "ACCEPT"});
}

/// refer to: https://www.ausweisapp.bund.de/sdk/commands.html#interrupt
class Interrupt extends Command {
  Interrupt() : super(CommandType.INTERRUPT, {"cmd": "INTERRUPT"});
}

