import 'dart:collection';

import 'package:ausweisapp2_sdk/ausweisapp2_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
    // this.tcTokenURL = "https://test.governikus-eid.de/DEMO",
    this.tcTokenURL = "https://test.governikus-eid.de/AusweisAuskunft/WebServiceRequesterServlet",
    //"https://test.governikus-eid.de/Autent-DemoApplication/RequestServlet?provider=demo_epa_20&redirect=true",
  }) : super(key: key);

  final String tcTokenURL;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  MessageType? _loginState;
  String? _accessRights;
  TextEditingController _canEditingController = TextEditingController();
  TextEditingController _pinEditingController = TextEditingController();
  bool _loading = false;
  Queue<String> _messages = Queue();

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    Ausweisapp2Sdk.dispose();
    super.dispose();
  }

  Future<void> init() async {
    Ausweisapp2Sdk.debug = true;
    final isOk = await Ausweisapp2Sdk.connect(onMessage);

    if (isOk) {
      _loading = true;
      setState(() {});
      runAuth();
    }
  }

  Future<void> accept() async {
    _loading = true;
    setState(() {});
    Ausweisapp2Sdk.send(Accept());
  }

  Future<void> enterCAN() async {
    _loading = true;
    setState(() {});
    final can = _canEditingController.text;
    Ausweisapp2Sdk.send(SetCAN(can));
  }

  Future<void> enterPIN() async {
    _loading = true;
    setState(() {});
    final pin = _pinEditingController.text;
    Ausweisapp2Sdk.send(SetPIN(pin));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
      ),
      body: Visibility(
        visible: !_loading,
        replacement: CircularProgressIndicator(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (_loginState == MessageType.ACCESS_RIGHTS) ...{
                Text(_accessRights ?? ''),
                ElevatedButton(
                  onPressed: accept,
                  child: Text('Akzeptieren'),
                ),
              } else if (_loginState == MessageType.INSERT_CARD) ...{
                Text('Bitte Ausweis einlesen!'),
              } else if (_loginState == MessageType.ENTER_CAN) ...{
                TextField(
                  decoration: InputDecoration(hintText: 'CAN eingeben'),
                  controller: _canEditingController,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                ),
                ElevatedButton(
                  onPressed: enterCAN,
                  child: Text('CAN Senden'),
                ),
              } else if (_loginState == MessageType.ENTER_PIN) ...{
                TextField(
                  decoration: InputDecoration(hintText: 'PIN eingeben'),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  controller: _pinEditingController,
                ),
                ElevatedButton(
                  onPressed: enterPIN,
                  child: Text('PIN Senden'),
                ),
              },
              SizedBox(height: 60),
              Text('Messages'),
              Divider(),
              for (final msg in _messages) ...{
                Text(msg),
                Divider(),
              }
            ],
          ),
        ),
      ),
    );
  }

  void onMessage(Message message) {
    if (_messages.length > 10) {
      _messages.removeLast();
    }
    _messages.addFirst(message.toString());

    final types = [
      MessageType.ACCESS_RIGHTS,
      MessageType.AUTH,
      MessageType.INSERT_CARD,
      MessageType.ENTER_PIN,
      MessageType.ENTER_CAN,
    ];

    if (types.contains(message.msg)) {
      if (message.msg == MessageType.ACCESS_RIGHTS) {
        final accessRights = message as AccessRights;
        _accessRights = accessRights.chat.required.join(', ');
      } else if (message.msg == MessageType.AUTH) {
        final auth = message as Auth;
        if (auth.url != null) {
          Navigator.pop<String>(context, auth.url);
        }
      }

      _loginState = message.msg;

      if ((_loginState == MessageType.ENTER_PIN || _loginState == MessageType.ENTER_NEW_PIN) &&
          defaultTargetPlatform == TargetPlatform.iOS) {
        Ausweisapp2Sdk.send(Interrupt());
      }
    }

    _loading = false;
    setState(() {});
  }

  void runAuth() {
    Ausweisapp2Sdk.send(RunAuth(widget.tcTokenURL));
  }
}
