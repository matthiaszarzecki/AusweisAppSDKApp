import 'package:ausweisapp2_sdk/model/command.dart';

/// refer to: https://www.ausweisapp.bund.de/sdk/commands.html#get-reader
class GetReader extends Command {
  GetReader(String readerName) : super(CommandType.GET_READER, {
    "cmd": "GET_READER",
    "name": readerName,
  });
}

/// refer to: https://www.ausweisapp.bund.de/sdk/commands.html#get-reader-list
class GetReaderList extends Command {
  GetReaderList() : super(CommandType.GET_READER_LIST, {
    "cmd": "GET_READER_LIST"
  });
}