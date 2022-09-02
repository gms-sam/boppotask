import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetails extends StatelessWidget {
  final String detailUrl;
  NewsDetails({required this.detailUrl});

  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: detailUrl,
        onWebViewCreated: ((WebViewController webViewController) {
          _completer.complete(webViewController); 
        }),
      ),
    );
  }
}
