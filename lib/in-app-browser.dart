import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';


class InAppBrowser extends StatefulWidget {
  final String url;

  InAppBrowser(this.url);

  _InAppBrowserState createState() => _InAppBrowserState(this.url);
}

class _InAppBrowserState extends State<InAppBrowser> {
  InAppWebViewController webView;
  String url;
  double progress = 0;

  _InAppBrowserState(url);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
     this.url = widget.url; 
    });
    return MaterialApp(
      onGenerateRoute: (RouteSettings settings) {
        debugPrint('Setting ${settings.arguments}');
      },
      onUnknownRoute: (RouteSettings settings) {
        debugPrint('Setting ${settings.arguments}');
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Careington'),
          backgroundColor: Colors.red,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              (progress != 1.0) ? LinearProgressIndicator(value: progress, backgroundColor: Colors.black26, valueColor: AlwaysStoppedAnimation(Colors.red),) : null,
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45)
                  ),
                  child: InAppWebView(
                    initialUrl: widget.url,
                    initialHeaders: {

                    },
                    initialOptions: {

                    },
                    onWebViewCreated: (InAppWebViewController controller) {
                      webView = controller;
                    },
                    onLoadStart: (InAppWebViewController controller, String url) {
                      setState(() {
                        this.url = url;
                      });
                    },
                    onProgressChanged: (InAppWebViewController controller, int progress) {
                      setState(() {
                        this.progress = progress/100;
                      });
                    },
                  ),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Icon(Icons.arrow_back),
                    onPressed: () {
                      if (webView != null) {
                        webView.goBack();
                      }
                    },
                  ),
                  RaisedButton(
                    child: Icon(Icons.arrow_forward),
                    onPressed: () {
                      if (webView != null) {
                        webView.goForward();
                      }
                    },
                  ),
                  RaisedButton(
                    child: Icon(Icons.refresh),
                    onPressed: () {
                      if (webView != null) {
                        webView.reload();
                      }
                    },
                  ),
                ],
              ),
            ].where((Object o) => o != null).toList(),
          ),
        ),
      ),
    );
  }
}