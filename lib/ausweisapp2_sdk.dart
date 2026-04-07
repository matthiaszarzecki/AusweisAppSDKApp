import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:ausweisapp2_sdk/model/command.dart';
import 'package:ausweisapp2_sdk/model/message.dart';
import 'package:flutter/services.dart';

export 'model/command.dart';
export 'model/message.dart';

class Ausweisapp2Sdk {
  static const MethodChannel _channel = MethodChannel('ausweisapp2_sdk');

  static Function(Message message)? _callback;

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static bool _debug = false;
  static bool get debug => _debug;
  static set debug(bool value) {
    _debug = value;
    _channel.invokeMethod('debug', {'value': debug});
  }

  static void dispose() {
    _channel.invokeMethod('disconnect');
    _callback = null;
  }

  /// Send a [command] as `Command` to AusweisApp2
  ///
  /// Throws [ArgumentError] if validation fails
  /// Returns `true` if no issues occurred otherwise `false`
  static Future<bool> send(Command command) async {
    if (command.validate()) {
      if (debug) log('Command: ${command.toString()}');
      final commandString = command.toJson();
      return await _channel.invokeMethod('send', {'command': commandString});
    } else {
      throw ArgumentError('Validation of command failed: \n${command.toString()}');
    }
  }

  /// Send a [command] as `String` to AusweisApp2
  /// Returns `true` if no issues occurred otherwise `false`
  static Future<bool> sendString(String command) async {
    return await _channel.invokeMethod('send', {'command': command});
  }

  /// Initialize AusweisApp2 SDK and bind background service
  /// Connect SDK and register a [callback] for incoming messages from AusweisApp2
  ///
  /// The [callback] invokes a function which provides a parameter as a subtype of [Message]
  /// After the [iOSInitializedCallback] is called, the app is ready to receive commands on iOS.
  ///
  /// Returns a [bool] if connection was successful `true` or unsuccessful `false`
  static Future<bool> connect(Function(Message message) callback) async {
    try {
      final isConnected = await _channel.invokeMethod('connect');

      if (isConnected) {
        _channel.setMethodCallHandler(_methodCallHandler);
        _callback ??= callback;

        return isConnected;
      } else {
        throw Exception('AusweisApp2 SDK could not connect!');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> _methodCallHandler(MethodCall call) async {
    if (call.method == 'messageCallback') {
      try {
        final jsonData = call.arguments['data'];

        if (debug) log('Message: ${jsonData}');

        final decodedJson = json.decode(jsonData);

        final messageType = MessageType.values.singleWhere((element) {
          return element.toString().endsWith(decodedJson['msg']);
        });

        switch (messageType) {
          case MessageType.ACCESS_RIGHTS:
            _callback?.call(AccessRights.fromJson(decodedJson));
            break;
          case MessageType.API_LEVEL:
            _callback?.call(ApiLevel.fromJson(decodedJson));
            break;
          case MessageType.AUTH:
            _callback?.call(Auth.fromJson(decodedJson));
            break;
          case MessageType.BAD_STATE:
            _callback?.call(BadState.fromJson(decodedJson));
            break;
          case MessageType.CERTIFICATE:
            _callback?.call(Certificate.fromJson(decodedJson));
            break;
          case MessageType.CHANGE_PIN:
            _callback?.call(ChangePin.fromJson(decodedJson));
            break;
          case MessageType.ENTER_CAN:
            _callback?.call(EnterCAN.fromJson(decodedJson));
            break;
          case MessageType.ENTER_PIN:
            _callback?.call(EnterPIN.fromJson(decodedJson));
            break;
          case MessageType.ENTER_NEW_PIN:
            _callback?.call(EnterNewPIN.fromJson(decodedJson));
            break;
          case MessageType.ENTER_PUK:
            _callback?.call(EnterPUK.fromJson(decodedJson));
            break;
          case MessageType.INFO:
            _callback?.call(Info.fromJson(decodedJson));
            break;
          case MessageType.INSERT_CARD:
            _callback?.call(InsertCard.fromJson(decodedJson));
            break;
          case MessageType.INTERNAL_ERROR:
            _callback?.call(InternalError.fromJson(decodedJson));
            break;
          case MessageType.INVALID:
            _callback?.call(Invalid.fromJson(decodedJson));
            break;
          case MessageType.READER:
            _callback?.call(Reader.fromJson(decodedJson));
            break;
          case MessageType.READER_LIST:
            _callback?.call(ReaderList.fromJson(decodedJson));
            break;
          case MessageType.STATUS:
            _callback?.call(Status.fromJson(decodedJson));
            break;
          case MessageType.UNKNOWN_COMMAND:
            _callback?.call(UnknownCommand.fromJson(decodedJson));
            break;
        }
      } catch (e, s) {
        log(e.toString(), error: e, stackTrace: s);
        rethrow;
      }
    } else {
      throw Exception('Method `${call.method}` not implemented.');
    }
  }
}
