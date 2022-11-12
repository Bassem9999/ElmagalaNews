import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewScreen extends StatelessWidget {
  String url;
   WebViewScreen({required this.url });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .2,
      ),
      body: WebView(
          initialUrl: url,
        ),
    );
  }
}