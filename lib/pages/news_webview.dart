import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_news/helper/text_styles.dart';
import 'package:my_news/model/news_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebview extends StatelessWidget {
  final NewsModel model;
  NewsWebview({Key key, this.model}) : super(key: key);

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.source.sourceName,
          style: OpensansBoldStyle(fontColor: Colors.white),
        ),
      ),
      body: WebView(
        initialUrl: model.url.trim(),
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
