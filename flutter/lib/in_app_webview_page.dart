import 'dart:developer';

import 'package:ausweisapp2_sdk_example/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppWebviewPage extends StatefulWidget {
  @override
  _InAppWebviewPageState createState() => _InAppWebviewPageState();
}

class _InAppWebviewPageState extends State<InAppWebviewPage> {
  final Uri _url = Uri.parse('<add_your_uri>');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ID')),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: _url),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            useShouldOverrideUrlLoading: true,
            useShouldInterceptFetchRequest: true,
            useShouldInterceptAjaxRequest: true,
          ),
        ),
        onLoadStop: (controller, url) async {
          final cookies = await CookieManager.instance().getCookies(url: _url);
          log('COOKIES: ${cookies.map((e) => e.name).join(', ')}');
        },
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          final request = navigationAction.request;
          log(request.url.toString());

          if (request.url?.isScheme('eid') ?? false) {
            final tcTokenURL = request.url?.queryParameters['tcTokenURL'];
            final resultUrl = await Navigator.push<String>(
              context,
              MaterialPageRoute(builder: (context) => LoginPage(tcTokenURL: tcTokenURL!)),
            );

            controller.loadUrl(urlRequest: URLRequest(url: Uri.parse(resultUrl!)));

            return NavigationActionPolicy.CANCEL;
          }

          return NavigationActionPolicy.ALLOW;
        },
      ),
    );
  }
}
