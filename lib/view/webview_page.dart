import 'dart:async';
import 'dart:developer' as prefix0;
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/generated/i18n.dart';
import 'package:flutter_demo/view/view_model/locale_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'view_model/intercepert_data_model.dart';

class WebViewPage extends StatefulWidget {
  final String _url;

  WebViewPage(this._url);

  @override
  State<StatefulWidget> createState() {
    return new WebViewPageState();
  }
}

class WebViewPageState extends State<WebViewPage> {
  final Completer<WebViewController> webviewCon =
      new Completer<WebViewController>();
  var connectivity = new Connectivity();

  Stream<ConnectivityResult> connectChangeListener() async* {
    await for (ConnectivityResult result
        in connectivity.onConnectivityChanged) {
      yield result;
    }
  }

  bool isLoading = true;

  @override
  void dispose() {
    super.dispose();
    listen.cancel();
  }

  WebViewController controller2;

  StreamSubscription<ConnectivityResult> listen;

  Future _openNewPageInNative(url) async {
    var result = await new MethodChannel('flutter.webview/newpage')
        .invokeMethod('openInNewPage', [url]);
    prefix0.log('call native $result');
    return result;
  }

  JavascriptChannel _getMibileInfo() {
    return new JavascriptChannel(
        name: 'MobileType',
        onMessageReceived: (message) {
          print('${message.message}');
          String mobileInfo = '';
          if (Platform.isAndroid) {
            mobileInfo = 'Android';
          }
          if (Platform.isIOS) {
            mobileInfo = 'IOS';
          }
          controller2
              .evaluateJavascript('clientType("$mobileInfo")')
              .then((value) {
            prefix0.log('method evaluateJavascript:$value');
          }).catchError((error) {
            prefix0.log('method evaluateJavascript: error$error');
          });
        });
  }

  Future<void> _launchInBrowser(url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'can not launch url';
    }
  }

  Uri currentUri;

  var curNet;
  bool select2 = false;

  @override
  Widget build(BuildContext context) {
    currentUri = Uri.parse(widget._url);
//    showSearch(context: context, delegate: new SearchBarDelegate());
    handleUrl(curNet, currentUri);
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: true,
        bottom: false,
        child: new Scaffold(
          drawer: new Drawer(
              child: Column(
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    Provider.of<LocaleViewModel>(context)
                        .changeLocale(new Locale('en', 'US'));
                  },
                  child: Text(S.of(context).english_)),
              FlatButton(
                  onPressed: () {
                    Provider.of<LocaleViewModel>(context)
                        .changeLocale(new Locale('zh', 'CN'));
                  },
                  child: Text(S.of(context).chinese)),
              ChoiceChip(
                label: Text(S.of(context).chinese),
                selected: select2,
                onSelected: (select){
                  setState(() {
                    prefix0.log("select $select");
                    select2 = select;
                  });
                },
              )
            ],
          )),

          appBar: new AppBar(
            title: new Text(S.of(context).appName),
            actions: <Widget>[
              new IconButton(icon: new Icon(Icons.search), onPressed: (){

              })
            ],
          ),
          body: new Builder(builder: (BuildContext context) {
            return Column(
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      _openNewPageInNative('http://www.baidu.com')
                          .then((value) {
                        prefix0.log('the result from native :$value');
                      }).catchError((error) {
                        prefix0.log('error$error');
                      });
                    },
                    child: Text('open in a new page ')),
                Expanded(
                  child: new ProgressHUD(
                      child: new WebView(
                        debuggingEnabled: true,
                        javascriptChannels: [_getMibileInfo()].toSet(),
                        onWebViewCreated: (controller) {
                          controller2 = controller;
//                    controller.clearCache();
                          listen = connectChangeListener().listen((result) {
                            processNetState(result, controller2);
                          });
                          connectivity.checkConnectivity().then((result) {
                            processNetState(result, controller2);
                          });
//                    controller.evaluateJavascript('window.mobile=true').then((
//                        value) {
//                      prefix0.log('evaluateJavascript:$value');
//                    }).catchError((error) {
//                      prefix0.log('evaluateJavascript: error$error');
//                    });
                          controller2
                              .evaluateJavascript('clientType("Android")')
                              .then((value) {
                            prefix0.log('method evaluateJavascript:$value');
                          }).catchError((error) {
                            prefix0
                                .log('method evaluateJavascript: error$error');
                          });
                        },
                        initialUrl: widget._url,
                        javascriptMode: JavascriptMode.unrestricted,
                        gestureRecognizers: [
                          new Factory(() => TapGestureRecognizer()),
                        ].toSet(),
                        navigationDelegate: (request) {
                          print(
                              'navigationDelegate  ${request.runtimeType} ::::: '
                              '${request.isForMainFrame}:::: ${request.url}:::');
                          prefix0.log(request.url);
                          print('navigationDelegate ${request.url}');
                          if (request.url == widget._url ||
                              request.url == 'about:blank') {
                            return NavigationDecision.navigate;
                          }
//                    if (request.url.contains('ssohandler.html')||
//                        request.url.contains('order/status.html')||
//                        request.url.contains('/order/confirm.html')||
//                        request.url.contains('http://am.aculearn'
//                            '.com/aculearn-idm/v4/opr/studioclient.asp')) {
//                      return NavigationDecision.navigate;
//                    }

                          var interceptrDataModel =
                              Provider.of<InterceptrDataModel>(context);
                          var uri = Uri.parse(request.url);
                          if (interceptrDataModel.interceptData.data
                              .contains(uri.path)) {
                            return NavigationDecision.navigate;
                          }
//                    if(request.url.contains('http://am.aculearn'
//                        '.com/aculearn-idm/v4/opr/studioclient.asp')||request
//                        .url.contains('http://online.lzr.com/ot/video/player'
//                        '.html?cnum=10170985')){
//                      return NavigationDecision.navigate;
//                    }
                          var url = request.url;
                          var uri2 = Uri.parse(url);

//                          online.acucom.net/ot/index.html
//                          acucom.net
//
//                          www.youtube.com/asdfadsf
//                          youtube.com
//
//                          curr
                          String otherNet;
                          otherNet = handleUrlC(otherNet, uri2);
                          if (this.curNet != otherNet) {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    fullscreenDialog: false,
                                    builder: (BuildContext context) {
                                      return new WebViewPage(request.url);
                                    }));
                            return NavigationDecision.prevent;
                          }
                          var tc = uri2.host.startsWith('class.');
                          var tc1 = uri2.host.startsWith('odev.');

                          if (tc || tc1) {
                            if (Platform.isAndroid) {
                              _openNewPageInNative(request.url).then((value) {
                                prefix0.log('the result from native :$value');
                              }).catchError((error) {
                                prefix0.log('error$error');
                              });
                            }
                            if (Platform.isIOS) {
                              _launchInBrowser(request.url)
                                  .then((value) {})
                                  .catchError((error) {
                                prefix0.log('$error');
                              });
                            }

                            return NavigationDecision.prevent;
                          }
                          if (uri2.host.startsWith('online.')) {
                            var uri = Uri.parse(request.url);
                            var host = uri.host;

                            print('host::$host::::path::::${uri.path}');

                            if ((currentUri.host + currentUri.path) ==
                                (uri.host + uri.path)) {
                              Navigator.pushReplacement(context,
                                  PageRouteBuilder(pageBuilder:
                                      (BuildContext context,
                                          Animation animation,
                                          Animation secondaryAnimation) {
                                return new FadeTransition(
                                  opacity: animation,
                                  child: WebViewPage(request.url),
                                );
                              })

                                  /* new MaterialPageRoute(
                                      fullscreenDialog: false,
                                      builder: (BuildContext context) {
                                        return new WebViewPage(request.url);
//                                })*/
                                  );
                            } else {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      fullscreenDialog: false,
                                      builder: (BuildContext context) {
                                        return new WebViewPage(request.url);
                                      }));
                            }
                            return NavigationDecision.prevent;
                          }
                          return NavigationDecision.navigate;
                        },
                        onPageFinished: (url) {
                          print('page  url:$url');
                          setState(() {
                            isLoading = false;
                          });
//                    controller2.evaluateJavascript
//                      ('window.mobile=true; alert("abccdsafasf")')
//                        .then
//                      ((value) {
//                      prefix0.log('evaluateJavascript $value');
//                    }).catchError((error) {
//                      prefix0.log('error $error');
//                    });

//                    controller2.evaluateJavascript('clientType("Android")')
//                        .then((
//                        value) {
//                      prefix0.log('method evaluateJavascript:$value');
//                    }).catchError((error) {
//                      prefix0.log('method evaluateJavascript: error$error');
//                    });
                        },
                      ),
                      inAsyncCall: isLoading),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  String handleUrl(curNet, currentUri) {
    var split = currentUri.host.split('.');
    if (split.length >= 3) {
      curNet = split[1] + '.' + split[2];
    } else {
      curNet = split[1];
    }
    this.curNet = curNet;
    return curNet;
  }

  String handleUrlC(curNet, currentUri) {
    var split = currentUri.host.split('.');
    if (split.length >= 3) {
      curNet = split[1] + '.' + split[2];
    } else {
      curNet = split[1];
    }
    return curNet;
  }

  void processNetState(
      ConnectivityResult result, WebViewController controller2) {
    var netState;
    switch (result) {
      case ConnectivityResult.wifi:
        netState = 'wifi';
        break;
      case ConnectivityResult.mobile:
        netState = 'mobileNetwork';
        break;
      case ConnectivityResult.none:
        netState = 'disconnected';
        break;
    }
    prefix0.log('$netState');

    controller2?.evaluateJavascript('window.netState($netState)');
  }

//  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
//    return JavascriptChannel(
//        name: 'toaster',
//        onMessageReceived: (JavascriptMessage message) {
//          print('${message.message}');
//        });
//  }
}

class ProgressHUD extends StatelessWidget {
  final Widget child;
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Animation<Color> valueColor;

  ProgressHUD({
    Key key,
    @required this.child,
    @required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.white,
    this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = new List<Widget>();
    widgetList.add(child);
    if (inAsyncCall) {
      final modal = new Stack(
        children: [
          new Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: false, color: color),
          ),
          new Center(
            child: new CircularProgressIndicator(
              valueColor: valueColor,
            ),
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}
