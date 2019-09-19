import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

// const CATCH_URLS = ['m.ctrip.com/', 'm.ctrip.com/html5/', 'm.ctrip.com/html5'];

class WebView extends StatefulWidget {
  String url;
  final String statusBarColor;
  final String title;
  final bool hideAppBar;
  final bool backForbid;

  WebView({this.url, this.statusBarColor, this.title, this.hideAppBar, this.backForbid = false}){
    if (url != null) {
      url = url.replaceAll("http://", 'https://');
    }
  }

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final webviewReference = FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;
  bool exiting = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    webviewReference.close();
    _onUrlChanged = webviewReference.onUrlChanged.listen((String url){
      print("afd");
    });
    _onStateChanged = webviewReference.onStateChanged.listen((WebViewStateChanged state){
      print("afdw");
      switch(state.type){
        case WebViewState.startLoad:
//          if(_isToMain(state.url) && !exiting){
//            if(widget.backForbid){
//              webviewReference.launch(widget.url);
//            }else{
//              Navigator.pop(context);
//              exiting = true;
//            }
//          }
          break;
        default:
          break;
      }
    });
    _onHttpError = webviewReference.onHttpError.listen((WebViewHttpError error){
      print(error);
    });
  }
  @override
  Widget build(BuildContext context) {
    String statusBarColorStr = widget.statusBarColor??'ffffff';
    Color backButtonColor;
    if(statusBarColorStr == 'ffffff'){
      backButtonColor = Colors.black;
    }else{
      backButtonColor = Colors.white;
    }
    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(Color(int.parse('0xff'+statusBarColorStr)), backButtonColor),
          Expanded(
            child: WebviewScaffold(
              url: widget.url,
              withZoom: true,
              withLocalStorage: true,
              hidden: true,
              initialChild: Container(
                color: Colors.white,
                child: Center(
                  child: Text('waiting...'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    webviewReference.dispose();
    super.dispose();
  }
  _appBar(Color backgroundColor, Color backButtonColor){
    if(widget.hideAppBar??false){
      return Container(
        color: backgroundColor,
        height: 30,
      );
    }
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.close,
                  size: 26,
                  color: backButtonColor,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  widget.title??'',
                  style: TextStyle(fontSize: 20, color: backButtonColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
//  _isToMain(String url){
//    bool contain = false;
//    for(final value in CATCH_URLS){
//      if(url?.endsWith(value) ?? false){
//        contain = true;
//        break;
//      }
//    }
//    return contain;
//  }
}
