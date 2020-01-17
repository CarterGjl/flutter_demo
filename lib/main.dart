import 'dart:async';
import 'dart:convert' as Convert;

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_demo/blocim/bloc_provider.dart';
import 'package:flutter_demo/data/course_entity.dart';
import 'package:flutter_demo/data/course_price_entiry.dart';
import 'package:flutter_demo/view/webview_app.dart';
import 'package:flutter_demo/view/webview_page.dart';
import 'package:flutter_demo/widget/rating_bar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'localizations/demo_localizations.dart';

void main() {
//  final counter = new CounterModel();
//  final textSize = 48;
//  runApp(Provider<int>.value(
//    value: textSize,
//    child: ChangeNotifierProvider.value(
//      value: counter,
//      child: CounterApp(),
//    ),
//  ));
//  runApp(new MaterialApp(
//    theme: ThemeData.dark(),
//    home: new CoursedetailsPage(),
//  ));
  /*runApp(new MaterialApp(
    theme: ThemeData.light(),
    showPerformanceOverlay: true,
    checkerboardOffscreenLayers: true,
    debugShowCheckedModeBanner: false,
    home: new Scaffold(
      body: new TestPage(),
    ),
  ));*/

//  runApp(FutureBuilderDemo());
/*  runApp(new MaterialApp(
    showPerformanceOverlay: true,
    checkerboardOffscreenLayers: true,
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    home: new Scaffold(
//      body: new FutureBuilderDemo(),
      body: new RxApp(),
    ),
  ));*/
//  runApp(BlocApp());
//runApp(new MaterialApp(
//  theme: ThemeData.dark(),
//  home: new InheritedWidgetTestRoute(),
//));
//  runApp(RxMvvmApp());
//  runApp(MaterialApp(
//    debugShowMaterialGrid: false,
//    debugShowCheckedModeBanner: false,
//    localizationsDelegates: [
//      GlobalMaterialLocalizations.delegate,
//      GlobalWidgetsLocalizations.delegate,
////      注册delegate
//      DemoLocalizationsDelegate()
//    ],
//    theme: ThemeData(platform: TargetPlatform.iOS),
////    home: TestPage(),
////    home: LoginPage(),
////    home: prefix0.HomePage(),
//
////    home: WebviewWidget('http://online.lzr.com/ot/index.html'),
////    home: WebviewWidget('https://tc.aculearn.com/command/10171107/7GaUTH'),
////    home: WebviewWidget('http://online.lzr.com/ot/index.html'),
//    home: WebViewPage('http://online.lzr.com/ot/index.html'),
////    home: WebViewWidget(),
//    title: 'home',
//  ));

  runApp(new WebviewApp());
//  runApp(ViewModelProvider(
//      viewModel: new ThemeModel(),
//      child: Builder(
//        builder: ((BuildContext context){
//          return StreamBuilder<ThemeData>(
//              stream: ViewModelProvider.of<ThemeModel>(context).dataStream,
//              builder: (context, snapshot) {
//                return new MaterialApp(
//                  theme: snapshot.data,
//                  home: ThemeChangePage(),
//                );
//              }
//          );
//        }),
//      ))
//  );
}

class BlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new BlocProvider(
      child: new MaterialApp(
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
//      注册delegate
          DemoLocalizationsDelegate()
        ],
        theme: ThemeData(platform: TargetPlatform.iOS),
//    home: TestPage(),
//    home: LoginPage(),
//    home: prefix0.HomePage(),

//    home: WebviewWidget('http://online.lzr.com/ot/index.html'),
//    home: WebviewWidget('https://tc.aculearn.com/command/10171107/7GaUTH'),
//    home: WebviewWidget('http://online.lzr.com/ot/index.html'),
        home: WebViewPage('http://online.lzr.com/ot/index.html'),
//        home: new TopPage(),
//    home: WebViewWidget(),
        title: 'home',
      ),
    );
  }
}

//class WebViewWidget extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    WebViewController controller2;
//    return new Container(
//      color: Colors.white,
//      child: SafeArea(
//          child: Scaffold(
//        body: WillPopScope(
//          onWillPop: () {
//            print('onWillPop');
//            controller2.canGoBack().then((value) {
//              if (value) {
//                controller2.goBack();
//              } else {
//                SystemNavigator.pop();
//              }
//            });
//            return Future.value(true);
//          },
//          child: new WebView(
//
//            initialUrl: 'https://online.acucom.net:6443/ot/index.html',
//            onPageFinished: (url) {},
//            onWebViewCreated: (controller) {
//              controller2 = controller;
//            },
//          ),
//        ),
//      )),
//    );
//  }
//}

//class WebviewWidget extends StatelessWidget {
//  final FlutterWebviewPlugin _webviewPlugin = new FlutterWebviewPlugin();
//  var currentUrl;
//
//  bool isFinished = false;
//
//  WebviewWidget(this.currentUrl);
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    print('current url $currentUrl');
////
////    _webviewPlugin.onStateChanged.listen((state) {
////      if (state.type == WebViewState.shouldStart) {
////        if(currentUrl == state.url||state.url=='about:blank'){
////          return;
////        }
////        _webviewPlugin.stopLoading();
////      }
////    });
////    _webviewPlugin.onUrlChanged.listen((url) {
////      if (url != 'about:blank') {
////        if (url != currentUrl) {
////          print('$url');
////          if (url.startsWith('http://account')) {
////            return;
////          }
////          Navigator.push(
////              context,
////              MaterialPageRoute(
////                  fullscreenDialog: false,
////                  builder: (BuildContext context) {
////                    return new WebviewWidget(url);
////                  }));
////        }
////      }
////    });
////    _webviewPlugin.onDestroy.listen((event) {
////      if (Navigator.canPop(context)) {
////        Navigator.of(context).pop();
////      } else {
////        SystemNavigator.pop();
////      }
////    });
//    _webviewPlugin.onUrlChanged.listen((url) {
////      print('onUrlChanged::::$url');
////      if (isFinished) {
////        _webviewPlugin.stopLoading();
////      }
////      if (url != 'about:blank') {
////        if (url != currentUrl) {
////          print('$url');
////          if (url.startsWith('http://account')) {
////            return;
////          }
////          if (!isFinished) {
////            return;
////          }
////          Navigator.push(
////              context,
////              MaterialPageRoute(
////                  fullscreenDialog: false,
////                  builder: (BuildContext context) {
////                    return new WebviewWidget(url);
////                  }));
////        }
////      }
//    });
//
//
//
//    _webviewPlugin.evalJavascript('window.mobile=true').then((value) {
//      print('js $value');
//    });
//    _webviewPlugin.onBack.listen((value) {
//      print('onBack:::$value');
//    });
//    _webviewPlugin.onStateChanged.listen((value) {
//      print('onStateChanged:::${value.type} url:: ${value.url} navigationType'
//          ' ${value.navigationType}');
//    });
//    return Container(
//      color: Colors.white,
//      child: SafeArea(
//        child: WillPopScope(
//          onWillPop: () {
//            return _onWillPop(context);
//          },
//          child: GestureDetector(
//            onHorizontalDragEnd: (details) {
//              print('$details');
//            },
//            child: new WebviewScaffold(
//              debuggingEnabled: true,
//              clearCache: true,
//              withJavascript: true,
//              userAgent:
//                  'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36',
////              userAgent: 'mobile=true',
//              hidden: true,
//
//
//              url: currentUrl,
////            initialChild: new Container(
////              alignment: Alignment.center,
////              child: new CircularProgressIndicator(),
////            ),
//              withZoom: false,
////            withLocalStorage: true,
//              displayZoomControls: false,
//              useWideViewPort: true,
//              withOverviewMode: true,
////      initialChild: new CircularProgressIndicator(),
////        appBar: new AppBar(
////          backgroundColor: Colors.white,
////          title: Text('aculearn online'),
////        ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//
//  Future<bool> _onWillPop(BuildContext context) async {
//    _webviewPlugin.close();
////    if (Navigator.canPop(context)) {
////      Navigator.of(context).pop(false);
////    } else {
////      SystemNavigator.pop();
////    }
//    return false;
//  }
////    return Future.value(currentUrl == 'https://online.acucom.net:6443');
//}

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bottomBar(context);
  }

  Widget bottomBar(context) {
    return Container(
      child: new Column(
        children: <Widget>[
          new Divider(
            height: 1,
            color: Colors.white70,
          ),
          new SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.only(left: 20),
                      child: new Text(
                        '฿ 1.00',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(left: 20),
                      child: new Text(
                        '36 vacancies',
                        textAlign: TextAlign.start,
                      ),
                    )
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text('Class 1'),
                    new Container(
                      margin: EdgeInsets.only(left: 1),
                      child: new IconButton(
                        icon: new Icon(Icons.keyboard_arrow_down),
                        onPressed: () {
                          print('keyboard_arrow_down');
                        },
                      ),
                    )
                  ],
                ),
                new Container(
                  margin: EdgeInsets.only(right: 20),
                  child: new RaisedButton(
                    onPressed: () {
                      print('Buy now');
                    },
                    child: new Text('Buy now'),
                    color: Colors.cyanAccent,
                    splashColor: Colors.cyan,
                  ),
                  alignment: Alignment.centerRight,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ScrollPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ScrollState();
  }
}

// ignore: must_be_immutable
class TSTabBar extends StatefulWidget {
  var state = new TSBarState();

  TSTabBar({Key key, TabCallBack onTabCallBack}) : super(key: key) {
    state.setTabCallBack(onTabCallBack);
  }

  void animateTo(int index) {
    state.jumpTo(index);
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return state;
  }
}

typedef TabCallBack = void Function(int index);

class TSBarState extends State<TSTabBar> with SingleTickerProviderStateMixin {
  int movieCount = 0;
  Color selectColor, unselectedColor;
  TextStyle selectStyle, unselectedStyle;
  Widget tabBar;
  TabController _tabController;
  var hotCount, soonCount; //热映数量、即将上映数量、
  TabCallBack onTabCallBack;

  void setTabCallBack(TabCallBack covariant) {
    this.onTabCallBack = covariant;
  }

  int comingSoonCount = 0;
  int selectIndex = 0;

  @override
  void initState() {
    selectColor = Colors.cyanAccent;
    unselectedColor = Color.fromARGB(255, 135, 135, 135);
    selectStyle = TextStyle(
        fontSize: 18, color: selectColor, fontWeight: FontWeight.bold);
    unselectedStyle = TextStyle(fontSize: 18, color: unselectedColor);
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(listener);

    tabBar = new TabBar(
      tabs: [
        new Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8),
            child: new Text('Course '
                'description')),
        new Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          child: new Text('Topics'),
        )
      ],
      indicatorColor: selectColor,
      labelColor: selectColor,
      labelStyle: selectStyle,
      unselectedLabelStyle: unselectedStyle,
      unselectedLabelColor: unselectedColor,
      indicatorSize: TabBarIndicatorSize.label,
      controller: _tabController,
      isScrollable: true,
    );
    super.initState();
  }

  void jumpTo(int index) {
    _tabController.animateTo(index);
  }

  @override
  void dispose() {
    _tabController.removeListener(listener);
    _tabController.dispose();
    super.dispose();
  }

  void listener() {
    if (_tabController.indexIsChanging) {
      var index = _tabController.index;
      print("HotSoonTabBar index changing=$index");
      selectIndex = index;
      setState(() {
        if (index == 0) {
          movieCount = hotCount;
        } else {
          movieCount = comingSoonCount;
        }
        if (onTabCallBack != null) {
          onTabCallBack(index);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: tabBar,
    );
  }
}

class ScrollState extends State<ScrollPage> {
  TSTabBar tsTabBar;
  var selectIndex = 0;
  PageController pageCon;

  @override
  void initState() {
    super.initState();

//    pageCon = new PageController();
//
//    pageCon.addListener(() {});
//    tsTabBar = new TSTabBar(
//      onTabCallBack: (index) {
//        setState(() {
//          selectIndex = index;
//          pageCon.animateToPage(selectIndex,
//              duration: new Duration(milliseconds: 300),
//              curve: Curves.decelerate);
//        });
//      },
//    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: new CustomScrollView(
        physics: new BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
//          new SliverToBoxAdapter(
//            child: new Container(
//              child: new Text('tetle'),
//            ),
//          ),
//          new SliverToBoxAdapter(
//            child: tsTabBar,
//          ),
//
        ],
      ),
    );
  }

  courseDescriptionView() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          child: new Text(
            "Course description",
            style: new TextStyle(fontSize: 17),
          ),
          margin: EdgeInsets.all(16),
        ),
        new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.all(8),
              child: new CircleAvatar(
//                backgroundImage: new NetworkImage(
//                    "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3463668003,3398677327&fm=58"),
                backgroundImage: new NetworkImage(
                    "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3463668003,3398677327&fm=58"),
              ),
            ),
            new Expanded(
              child: new Container(
                padding: EdgeInsets.all(8),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      'Teacher Wang',
                      style:
                          new TextStyle(color: Colors.cyanAccent, fontSize: 16),
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      child: new Text(
                        'This is a  good teacher. This is a good teacher. This'
                        ' is a good teacher. This is a good teacher. This is a '
                        'good teacher. This is a teacher. good…',
                        style:
                            new TextStyle(color: Colors.black38, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            ),
            new Container(
              child: new IconButton(
                icon: new Icon(Icons.chevron_right),
                onPressed: () {
                  print('chevron_right');
                },
              ),
            )
          ],
        ),

        ///course desc
      ],
    );
  }
}

class TestPage1 extends StatefulWidget {
  final CourseDetail courseDetail;

  TestPage1(this.courseDetail);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new TestPageState();
  }
}

class TestPageState extends State<TestPage1> {
  var selectIndex = 0;
  Color selectColor, unselectedColor;
  TextStyle selectStyle, unselectedStyle;
  CourseDetail courseDetail;
  bool isError = false;

  @override
  void initState() {
    courseDetail = widget.courseDetail;
    selectColor = Colors.cyanAccent;
    unselectedColor = Color.fromARGB(255, 135, 135, 135);
    selectStyle = TextStyle(
        fontSize: 18, color: selectColor, fontWeight: FontWeight.bold);
    unselectedStyle = TextStyle(fontSize: 18, color: unselectedColor);
//    getRes().then((value) {
//      print('getressss:$value');
//      setState(() {
//        courseDetail = value;
//      });
//    }).catchError((error) {
//      setState(() {
//        isError = true;
//      });
//      print('error：：：：$error');
//    });
    super.initState();
  }

  Future<CourseDetail> getRes() async {
    var dio = new Dio();

//    https://online.acucom.net:6443/rest/otstudent/mobile/course/5d413f6a99b8870037474035/detail"
    var courseId = "5d413f6a99b8870037474035";

//    Options options = new Options(method: "GET",)
    Response<String> course = await dio.get("https://online.acucom"
        ".net:6443/rest/otstudent/mobile/course/$courseId/detail");
    var jsonDecode = Convert.jsonDecode(course.data);

    var courseDetailJson = jsonDecode['data'];
    print('$courseDetailJson');
//    print('res::::${course.data}');
    var courseDetail = CourseDetail.fromJson(courseDetailJson);
    print('courseDetail:::::::$courseDetail');
    return courseDetail;
  }

  headerView() {
    return Column(
      children: <Widget>[
        Stack(
            //alignment: const FractionalOffset(0.9, 0.1),//方法一
            children: <Widget>[
              new Image.asset(
//                'images/lake.jpg',
                'images/lake.jpg',
                width: MediaQuery.of(context).size.width,
                height: 210,
                fit: BoxFit.cover,
              ),
            ]),
        SizedBox(
            height: 1, child: Container(color: Theme.of(context).primaryColor)),
        SizedBox(height: 10),
      ],
    );
  }

  courseTitle() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          margin: EdgeInsets.all(15.0),
          child: new Text(
            'Eighth grade geography : Common lala celestial system',
//            '${courseDetail?.course?.name}',
            style: new TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        new Row(
          children: <Widget>[
            RatingBar(
              3,
//              courseDetail?.course?.score,
              fontSize: 13,
            ),
//            new Container(
//              padding: EdgeInsets.all(8),
//              child: new Text(
//                '${courseDetail.course.score}',
//                style: new TextStyle(fontSize: 13),
//              ),
//              alignment: Alignment.centerRight,
//            ),
            new Container(
              padding: EdgeInsets.all(8),
              child: new Container(
                  margin: EdgeInsets.only(left: 117, right: 17),
                  child: new Text(
                    '/*${courseDetail?.course?.participants}*/ participant(s)',
                    style: new TextStyle(fontSize: 13),
                  )),
              alignment: Alignment.centerRight,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        )
      ],
    );
  }

//  Widget bottomBar() {
//    return Container(
//      color: Colors.black12,
//      height: 60,
//      child: new Column(
//        children: <Widget>[
//          new Divider(
//            height: 1,
//            color: Colors.white70,
//          ),
//          new SizedBox(
//            width: MediaQuery.of(context).size.width,
//            height: 50,
//            child: new Row(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                new Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  children: <Widget>[
//                    new Container(
//                      margin: EdgeInsets.only(left: 20),
//                      child: new Text(
//                        '฿ 1.00',
//                        style: TextStyle(color: Colors.orange),
//                        textAlign: TextAlign.start,
//                      ),
//                    ),
//                    new Container(
//                      margin: EdgeInsets.only(left: 20),
//                      child: new Text(
//                        '36 vacancies',
//                        textAlign: TextAlign.start,
//                      ),
//                    )
//                  ],
//                ),
//                new Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    new Text(
//                        'Class ${1 + courseDetail?.course?.classes[0]?.index}'),
//                    new Container(
//                      margin: EdgeInsets.only(left: 1),
//                      child: new IconButton(
//                        onPressed: () {
//                          if (isShowing) {
//                            Navigator.of(context).pop();
//                          } else {
//                            Scaffold.of(context)
//                                .showBottomSheet(bottomSheet.builder);
//                          }
//                          print('keyboard_arrow_down');
//                        },
//                        icon: new Icon(Icons.keyboard_arrow_down),
//                      ),
//                    )
//                  ],
//                ),
//                new Container(
//                  margin: EdgeInsets.only(right: 20),
//                  child: new RaisedButton(
//                    onPressed: () {
//                      print('Buy now');
//                    },
//                    child: new Text('Buy now'),
//                    color: Colors.cyanAccent,
//                    splashColor: Colors.cyan,
//                  ),
//                  alignment: Alignment.centerRight,
//                )
//              ],
//            ),
//          )
//        ],
//      ),
//    );
//  }

  coursedetailsPage1() {
    return Column(
      children: <Widget>[
        courseDescriptionView(),
        new Container(
          color: Colors.white70,
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Text(
//            'This is a  good teacher. This is a good teacher. This'
//            ' is a good teacher. This is a good teacher. This is a '
//            'good teacher. This is a teacher. '
//            'good…cxzcdsfdasfasfdasfdasfhdaskl '
//            'fdasfasfadsfndashjfkahfg范德萨发大水发大厦禄口街道三顿饭方能打开立方a'
//            '福农卡上带你fkdas白金卡发多少部分即可大厦部分'
//            '即可大部分as即可大部分'
//            '白金卡费absdjkfa大手机可能'
//            'kadhsfijdasl;ik '
//            'fjdoishfi;'
//            'oadsvhfiuvbnifurqwp8vu390rueqw90nrueqw90vue90ruenvw09urw90qc'
//            'ruew90r98nqwevnruy09eqvwnuwqrusdfdasfdaskfljdas '
//            'fhdiosf ji adosjfdiao sjnfkldasnf '
//            'lkdfnioeqwfniewqpfnieonf ewiqnf iunfioqwef '
//            'wioefbiweoqfbew iobfwieoq qwem90rveuwm9'
//            '-rew90ueqw9verw0qfndklsjfkldjfkldasjfl;'
//            'djsfl;kdsajfk;ldnsklndsak;fn;iodsfn dlsn fklnf ',
            '${courseDetail?.course?.desp[0].content}',
            softWrap: true,
            style: new TextStyle(color: Colors.black38, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Image.network(
//            'images/lake.jpg',
            'https://dtc.acucom.net:8066/rest/resource/${courseDetail?.course?.desp[1].content}',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }

  courseDescriptionView() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          child: new Text(
            "Course description",
            style: new TextStyle(fontSize: 17),
          ),
          margin: EdgeInsets.all(16),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.all(8),
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage(
                          "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3463668003,3398677327&fm=58"),
//                      backgroundImage: new NetworkImage("https://dtc.acucom"
//                          ".net:8066/rest/resource/${courseDetail.teacher.icon}"),
                    ),
                  ),
                  new Expanded(
                    child: new Container(
                      padding: EdgeInsets.all(8),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
//                            'Teacher Wang',
                            '${courseDetail?.teacher?.name}',
                            style: new TextStyle(
                                color: Colors.cyanAccent, fontSize: 16),
                          ),
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            child: new Text(
//                              'This is a  good teacher. This is a good teacher. This'
//                              ' is a good teacher. This is a good teacher. This is a '
//                              'good teacher. This is a teacher. good…',
                              '${courseDetail?.teacher?.intro}',
                              style: new TextStyle(
                                  color: Colors.black38, fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              child: new IconButton(
                onPressed: () {
                  print('chevron_right');
                },
                icon: new Icon(Icons.chevron_right),
              ),
            )
          ],
        ),
      ],
    );
  }

  content1() {
    return Column(
      children: <Widget>[
        Expanded(
          child: DefaultTabController(
            length: 2,
            child: new NestedScrollView(
                physics: new BouncingScrollPhysics(),
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    new SliverAppBar(
                      floating: true,
                      pinned: true,
                      title: new Text('test'),
                    ),
                    new SliverToBoxAdapter(
                      child: headerView(),
                    ),
                    new SliverToBoxAdapter(
                      child: courseTitle(),
                    ),
                    new SliverToBoxAdapter(
                      child: new Container(
                        color: Colors.white70,
                        height: 20,
                      ),
                    ),
                    new SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      child: new SliverAppBar(
                        backgroundColor: Colors.white10,
                        flexibleSpace: new TabBar(
                            tabs: [
                              new Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(8),
                                  child: new Text('Course '
                                      'description')),
                              new Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(8),
                                child: new Text('Topics'),
                              ),
                            ],
                            indicatorColor: selectColor,
                            labelColor: selectColor,
                            labelStyle: selectStyle,
                            unselectedLabelStyle: unselectedStyle,
                            unselectedLabelColor: unselectedColor,
                            indicatorSize: TabBarIndicatorSize.label,
                            isScrollable: true),
                      ),
                    ),
                  ];
                },
                body: new TabBarView(
                    physics: new BouncingScrollPhysics(),
                    children: [
                      new Builder(builder: (BuildContext context) {
                        return new CustomScrollView(
                          slivers: <Widget>[
                            new SliverOverlapInjector(
                                handle: NestedScrollView
                                    .sliverOverlapAbsorberHandleFor(context)),
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                return getCommonItem(index);
                              },
                                  childCount:
                                      courseDetail?.course?.desp?.length),
                            )
                          ],
                        );
                      }),

                      new Builder(builder: (BuildContext context) {
                        return new CustomScrollView(
                          slivers: <Widget>[
                            new SliverOverlapInjector(
                                handle: NestedScrollView
                                    .sliverOverlapAbsorberHandleFor(context)),
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                if (index == 0) {
                                  return Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      'Topics',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                  );
                                } else {
                                  return new TopicsWidget(
                                      courseDetail?.course?.lessons[index - 1],
                                      index - 1);
                                }
                              },
                                  childCount: 1 +
                                      courseDetail?.course?.lessons?.length),
                            ),
                            SliverToBoxAdapter(
                              child: new Organisation(courseDetail.enterprise),
                            )
                          ],
                        );
                      }),
//                  new Container(
//                    child: new Text('dasfgsagfdasgdasg'),
//                  )
                    ])),
          ),
        ),
//        bottomBar()
        CourseDetailBottomBar(courseDetail)
      ],
    );
  }

  content() {
    return Column(
      children: <Widget>[
        Expanded(
          child: new CustomScrollView(
            shrinkWrap: true,
            physics: new BouncingScrollPhysics(),
            slivers: <Widget>[
              new SliverToBoxAdapter(
                child: headerView(),
              ),
              new SliverToBoxAdapter(
                child: courseTitle(),
              ),
              new SliverToBoxAdapter(
                child: new Container(
                  color: Colors.white70,
                  height: 20,
                ),
              ),
              new SliverToBoxAdapter(
                child: TSTabBar(
                  onTabCallBack: (index) {
                    setState(() {
                      selectIndex = index;
                    });
                  },
                ),
              ),

//            new SliverList(
//              delegate: new SliverChildBuilderDelegate(
//                  (BuildContext context, int index) {
//                return new Stack(
//                  children: <Widget>[
//                    new Offstage(
//                      offstage: selectIndex == 1,
//                      child: coursedetailsPage1(),
//                    ),
//                    new Offstage(
//                      offstage: selectIndex == 0,
//                      child: new Text('哈哈哈哈哈'),
//                    )
//                  ],
//                );
//              }, childCount: 1),
//            ),

              new SliverToBoxAdapter(
//                child: new Stack(
//                  children: <Widget>[
//                    new Offstage(
//                      offstage: selectIndex == 1,
//                      child: coursedetailsPage1(),
//                    ),
//                    new Offstage(
//                      offstage: selectIndex == 0,
//                      child: new Text('哈哈哈哈哈'),
//                    )
//                  ],
//                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: PageView.custom(
                      pageSnapping: true,
                      scrollDirection: Axis.horizontal,
                      physics: new BouncingScrollPhysics(),
                      childrenDelegate:
                          new SliverChildBuilderDelegate((context, index) {
                        if (index == 0) {
                          return new Container(
                            child: new Text('test'),
                          );
                        } else {
                          return new Container(
                            child: new ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                                return new Container(
                                  height: 40,
                                  child: new Text('item::$index'),
                                );
                              },
                              itemCount: 10,
                            ),
                          );
                        }
                      }, childCount: 3)),
//                      child: new PageView(
//                        scrollDirection: Axis.horizontal,
//                        physics: new BouncingScrollPhysics(),
//                        children: <Widget>[
//                          new Container(
//                            child: new Text('test aaa'),
//                          ),
//                          new Container(
//                            child: new Text('abc'),
//                          )
//                        ],
//                      ),
                ),
              )
//            new SliverToBoxAdapter(
//              child: new SizedBox(
//                width: 400,
//                child: new DefaultTabController(
//                  child: new Scaffold(
//                    appBar: new AppBar(
//                      title: new Text('test'),
//                      bottom: new TabBar(
//                        tabs: <Widget>[
//                          new SizedBox(
//                            child: new Align(
//                              child: new Text('Course description'),
//                              alignment: Alignment.center,
//                            ),
//                            height: 50,
//                          ),
//                          new SizedBox(
//                            child: new Align(
//                              child: new Text('Topics '),
//                              alignment: Alignment.center,
//                            ),
//                            height: 50,
//                          )
//                        ],
//                      ),
//                    ),
//                    body: new TabBarView(
//                      children: <Widget>[
//                        new Container(
//                          child: new Text('1'),
//                        ),
//                        new Container(
//                          child: new Text('2'),
//                        )
//                      ],
//                    ),
//                  ),
//                  length: 2,
//                ),
//              )
//            ),
//            new SliverToBoxAdapter(
//              child: new TSTabBar(),
//            ),
//            new SliverToBoxAdapter(
//              child: new SizedBox(
//                width: 800,
//                child: new PageView(
//                  scrollDirection: Axis.horizontal,
//                  controller: pageCon,
//                  physics: new BouncingScrollPhysics(),
//                  onPageChanged: (index) {},
//                  children: <Widget>[
//                    new SizedBox(
//                      width: 800,
//                      height: 300,
//                      child: new Container(
//                        child: new Text('1'),
//                      ),
//                    ),
//                    new SizedBox(
//                      width: 800,
//                      height: 500,
//                      child: new Container(
//                        child: new Text("3"),
//                      ),
//                    )
//                  ],
//                ),
//              ),
//            )
            ],
          ),
        ),
        CourseDetailBottomBar(courseDetail)
//        bottomBar()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return content1();
//    if (isError) {
//      return new Container(
//        child: new Text('error'),
//      );
//    } else {
//      if (courseDetail != null) {
//        return content1();
//      } else {
//        return new Container(
//          alignment: Alignment.center,
//          child: new CupertinoActivityIndicator(),
//        );
//      }
//    }

//    return ;
  }

  getCommonItem(int index) {
    if (courseDetail.course.desp[index].type == "text") {
      return Column(
        children: <Widget>[
          courseDescriptionView(),
          new Container(
            color: Colors.white70,
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: new Text(
//            'This is a  good teacher. This is a good teacher. This'
//            ' is a good teacher. This is a good teacher. This is a '
//            'good teacher. This is a teacher. '
//            'good…cxzcdsfdasfasfdasfdasfhdaskl '
//            'fdasfasfadsfndashjfkahfg范德萨发大水发大厦禄口街道三顿饭方能打开立方a'
//            '福农卡上带你fkdas白金卡发多少部分即可大厦部分'
//            '即可大部分as即可大部分'
//            '白金卡费absdjkfa大手机可能'
//            'kadhsfijdasl;ik '
//            'fjdoishfi;'
//            'oadsvhfiuvbnifurqwp8vu390rueqw90nrueqw90vue90ruenvw09urw90qc'
//            'ruew90r98nqwevnruy09eqvwnuwqrusdfdasfdaskfljdas '
//            'fhdiosf ji adosjfdiao sjnfkldasnf '
//            'lkdfnioeqwfniewqpfnieonf ewiqnf iunfioqwef '
//            'wioefbiweoqfbew iobfwieoq qwem90rveuwm9'
//            '-rew90ueqw9verw0qfndklsjfkldjfkldasjfl;'
//            'djsfl;kdsajfk;ldnsklndsak;fn;iodsfn dlsn fklnf ',
              '${courseDetail.course.desp[0].content}',
              softWrap: true,
              style: new TextStyle(color: Colors.black38, fontSize: 16),
            ),
          ),
        ],
      );
    } else if (courseDetail.course.desp[index].type == "image") {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Image.asset(
          'images/lake.jpg',
//          'https://dtc.acucom.net:8066/rest/resource/${courseDetail.course.desp[1].content}',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      );
    }
  }
}

class CoursedetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CourseDetailsState();
  }
}

class NestedScrollViewRefresh extends StatelessWidget {
  final scollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RefreshIndicator(
      onRefresh: () {
        print('onRefresh');
      },
      child: new NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScroled) {
          return <Widget>[
            new SliverAppBar(
              title: new Text('Course details'),
            )
          ];
        },
        scrollDirection: Axis.vertical,
        controller: scollController,
        body: new Container(
          height: 210,
          child: new Container(
            height: 210,
            child: new Image.asset(
              'images/lake.jpg',
              width: MediaQuery.of(context).size.width,
              height: 210,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class CourseDetailsState extends State<CoursedetailsPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Course details'),
          actions: <Widget>[
            new IconButton(
              onPressed: () {
                print('settings');
              },
              icon: new Icon(Icons.settings),
            )
          ],
        ),
        body: new Flex(
          direction: Axis.vertical,
          children: <Widget>[
            new Expanded(
              child: new ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0.0),
                children: <Widget>[
                  new Column(
                    children: _buildContent(),
                  )
                ],
              ),
              flex: 11,
            ),
            new Expanded(
              flex: 1,
              child: new Container(),
            )
          ],
        )

//      body: new Container(
//        child: new Image.asset(
//          'images/lake.jpg',
//          width: MediaQuery.of(context).size.width,
//          height: 210.0,
//          fit: BoxFit.cover,
//        ),
//      ),
        );
  }

  tabBar1() {
    return new DefaultTabController(
      initialIndex: 0,
//      child: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('test'),
//          bottom: new TabBar(
//            isScrollable: true,
//            tabs: <Widget>[
//              new SizedBox(
//                child: new Align(
//                  child: new Text('Course description'),
//                  alignment: Alignment.center,
//                ),
//                height: 50,
//              ),
//              new SizedBox(
//                child: new Align(
//                  child: new Text('Topics '),
//                  alignment: Alignment.center,
//                ),
//                height: 50,
//              )
//            ],
//          ),
//        ),
//        body: new TabBarView(
//          children: <Widget>[
//            courseDescriptionView(),
//            new Container(
//              child: new Text('2'),
//            )
//          ],
//        ),
//      ),
      child: new Column(
        children: <Widget>[
          new TabBar(
            tabs: <Widget>[
              new SizedBox(
                child: new Align(
                  child: new Text('Course description'),
                  alignment: Alignment.center,
                ),
                height: 50,
              ),
              new SizedBox(
                child: new Align(
                  child: new Text('Topics '),
                  alignment: Alignment.center,
                ),
                height: 50,
              )
            ],
          ),
          new Divider(
            color: Colors.white70,
            height: 1,
          ),
          detailView()
        ],
      ),
      length: 2,
    );
  }

  _buildContent() {
    List<Widget> _list = [];
    _list.add(tabBar1());

    return _list;
  }

  List list = [];

  void buildWidget() {
    list.add(new Container(
      child: new Text('topic'),
    ));
  }

  @override
  void initState() {
    super.initState();
//    _tabController = new DefaultTabController( length: 2);
//    setState(() {
//      list.add(courseDescriptionView());
//      list.add(new Container(
//        child: new Text('topic'),
//      ));
//    });
  }

  Widget detailView() {
//    buildWidget();
//    return new TabBarView(
//      children: <Widget>[
//        new Container(
//          child: new Text('2'),
//        )
//      ],
//    );
    return new Container();
  }
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: ThemeData.dark(),
      home: new FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterModel>(context);
    final textSize = Provider.of<int>(context).toDouble();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('first page'),
      ),
      body: new Center(
        child: new Text(
          "Value:_${_counter.value}",
          style: new TextStyle(fontSize: textSize),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
            new MaterialPageRoute(builder: (context) => new SecondPage())),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('second page'),
      ),
      body: new Consumer2<CounterModel, int>(
        builder: (context, CounterModel counter, int textSize, _) => new Center(
          child: new Text(
            'Value :${counter.value}',
            style: new TextStyle(fontSize: textSize.toDouble()),
          ),
        ),
      ),
      floatingActionButton: new Consumer<CounterModel>(
        builder: (context, CounterModel counter, child) =>
            new FloatingActionButton(
          onPressed: () => counter.increment(),
          child: child,
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class CounterModel with ChangeNotifier {
  int _count = 0;

  int get value => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class ProviderBloc {
  int _count = 0;
  var _countController = StreamController<int>.broadcast();

  Stream<int> get stream => _countController.stream;

  int get count => _count;

  increment() {
    _countController.sink.add(++_count);
  }

  dispose() {
    _countController.close();
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TopicsWidget extends StatelessWidget {
  final Lesson lesson;
  final int index;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    '$index',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  )),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      '${lesson.name}',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    )),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 8),
          margin: EdgeInsets.only(left: 15),
          child: Divider(
            height: 3,
            color: Colors.black38,
          ),
        )
      ],
    );
  }

  TopicsWidget(this.lesson, this.index);
}

class Organisation extends StatelessWidget {
  final Enterprise enterprise;

  Organisation(this.enterprise);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.all(15),
            child: Text(
              'Organisation',
              style: TextStyle(color: Colors.black, fontSize: 17),
            )),
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              child: Image.network(
                "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3463668003,"
                "3398677327&fm=58",
                height: 70,
                width: 70,
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
//                    'Aplomb Tuition Center',
                      '${enterprise?.ename}',
                      style: TextStyle(fontSize: 17, color: Colors.cyanAccent),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 40),
                          child: Text(
//                          '34',
                            '${enterprise?.totalCourse}',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black38),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 78),
                          child: Text(
//                          '5'
//                          '.0',
                            '${enterprise?.score}',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black38),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Total course',
                          style: TextStyle(fontSize: 15, color: Colors.black38),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 35),
                          child: Text(
                            'Rating',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black38),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),

        //desp
        Container(
          margin: EdgeInsets.all(15),
          child: Text(
//            'This is a Tuition Center details. This is a Tuition Center details. This is a Tuition Center details. This is a Tuition Center details. This is a Tuition Center details. ',
            '${enterprise.intro}',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        )
      ],
    );
  }
}

class CourseDetailBottomBar extends StatefulWidget {
  final CourseDetail courseDetail;

  CourseDetailBottomBar(this.courseDetail);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CourseDetailBottomBarState();
  }
}

class CourseDetailBottomBarState extends State<CourseDetailBottomBar> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  bool isShowing = false;
  BottomSheet bottomSheet;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    bottomSheet = BottomSheet(
      onClosing: () {},
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0)),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * (4 / 5),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: new Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Container(
                        width: 110,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0) {
                              return Container(
                                margin: EdgeInsets.only(left: 15),
                                child: OutlineButton(
                                    borderSide: BorderSide(color: Colors.cyan),
                                    onPressed: () {},
                                    child: new Text(
                                      'Class $index',
                                      style: TextStyle(color: Colors.cyan),
                                    ),
                                    color: Colors.white,
//                                    splashColor: Colors.cyan,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10.0))),
                              );
                            } else {
                              return InkWell(
                                onTap: () {},
                                child: new Container(
                                  padding: EdgeInsets.all(25),
                                  margin: EdgeInsets.only(left: 9),
                                  child: Text('Class $index'),
                                ),
                              );
                            }
                          },
                          itemCount: 5,
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: VerticalDivider(
                          color: Colors.black26,
                        )),
                    Expanded(
                      child: NotificationListener<OverscrollNotification>(
                        onNotification: (OverscrollNotification notification) {
                          if (notification.dragDetails != null &&
                              notification.dragDetails.delta != null) {
                            if (isShowing) {
                              isShowing = false;
                            }
                          }
                          return false;
                        },
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return new Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      '$index.This is a test course: Lesson '
                                      'test one test one ',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ),
                                  Text(
                                    '10 May 2019 Fri 04:00pm - 05:15pm',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black26),
                                  ),
                                  Divider(
                                    color: Colors.black26,
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: 29,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                width: MediaQuery.of(context).size.width * (3 / 4),
                child: FlatButton(
                    onPressed: () {},
                    child: new Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.cyan,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0))),
              )
            ],
          ),
        );
      },
    );
    return bottomBar();
  }

  Widget bottomBar() {
    return Container(
      color: Colors.black12,
      height: 60,
      child: new Column(
        children: <Widget>[
          new Divider(
            height: 1,
            color: Colors.white70,
          ),
          new SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //价格及人数
                new PriceCountWidget(
                    widget?.courseDetail?.course?.classes[0]?.id),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                        'Class ${1 + widget.courseDetail?.course?.classes[0]?.index}'),
                    new Container(
                      margin: EdgeInsets.only(left: 1),
                      child: new IconButton(
                        onPressed: () {
                          if (isShowing) {
                            Navigator.of(context).pop();
                          } else {
                            Scaffold.of(context)
                                .showBottomSheet(bottomSheet.builder);
//                            isShowing = true;
                          }
                          print('keyboard_arrow_down');
                        },
                        icon: new Icon(Icons.keyboard_arrow_down),
                      ),
                    )
                  ],
                ),
                new Container(
                  margin: EdgeInsets.only(right: 20),
                  child: new RaisedButton(
                    onPressed: () {
                      print('Buy now');
                    },
                    child: new Text('Buy now'),
                    color: Colors.cyanAccent,
                    splashColor: Colors.cyan,
                  ),
                  alignment: Alignment.centerRight,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PriceCountWidget extends StatefulWidget {
  final String courseId;

  PriceCountWidget(this.courseId);

  @override
  State<StatefulWidget> createState() {
    return new PriceCountWidgetState();
  }
}

class PriceCountWidgetState extends State<PriceCountWidget> {
  CoursePriceInfoEntity _coursePriceInfoEntity;

  @override
  void initState() {
    getPriceInfo(widget.courseId).then((value) {
      setState(() {
        _coursePriceInfoEntity = value;
      });
    }).catchError((onError) {
      print('$onError');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_coursePriceInfoEntity == null) {
      return new Container(
        margin: EdgeInsets.only(left: 20),
        alignment: Alignment.center,
        child: CupertinoActivityIndicator(),
      );
    }
    return priceCount();
  }

  Widget priceCount() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Container(
          margin: EdgeInsets.only(left: 20),
          child: new Text(
//            '฿ 1.00',
            '฿ ${_coursePriceInfoEntity?.price}',
            style: TextStyle(color: Colors.orange),
            textAlign: TextAlign.start,
          ),
        ),
        new Container(
          margin: EdgeInsets.only(left: 20),
          child: new Text(
//            '36 vacancies',
            '${_coursePriceInfoEntity?.ramainApplyNum} vacancies',
            textAlign: TextAlign.start,
          ),
        )
      ],
    );
  }

  Future<CoursePriceInfoEntity> getPriceInfo(String courseId) async {
    var dio = new Dio();

    Response<String> course = await dio.get("https://online.acucom"
        ".net:6443/rest/otstudent/mobile/ot/class/$courseId/lessons");
    var jsonDecode = Convert.jsonDecode(course.data);

    var code = jsonDecode['code'];
    if (code == 1) {
      var courseDetailJson = jsonDecode['data'];
      print('$courseDetailJson');
      var courseDetail = CoursePriceInfoEntity.fromJson(courseDetailJson);
      print('courseDetail:::::::$courseDetail');
      return courseDetail;
    } else {
      return Future.error('getPriceError');
    }
  }
}

class MyDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'flutter demo',
      theme: ThemeData(primaryColor: Colors.red),
    );
  }
}

///FutureBuilder的future传的内容
typedef LoadDataFuture<T> = Future<T> Function(BuildContext context);

abstract class NetNormalWidget<T> extends StatelessWidget {
  final T bean; //通用数据类

  NetNormalWidget({this.bean});

  @override
  Widget build(BuildContext context) {
    return buildContainer(bean);
  }

  ///给定义Widget赋值
  Widget buildContainer(T t);
}

class FutureBuilderWidget<T> extends StatefulWidget {
  final Widget loadingWidget;
  final Widget errorWidget;
  final NetNormalWidget<T> commonWidget;
  final LoadDataFuture<T> loadData;

  FutureBuilderWidget(
      {this.loadingWidget,
      this.errorWidget,
      @required this.commonWidget,
      @required this.loadData});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new FutureBuilderWidgetState<T>();
  }
}

///net出错 回调
abstract class ErrorCallback {
  void retryCall();
}

///网络请求 失败 Widget
class NetErrorWidget extends StatelessWidget {
  final Widget errorChild;
  final ErrorCallback callback;

  NetErrorWidget({@required this.errorChild, this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: errorChild,
      onTap: () => callback?.retryCall(),
    );
  }
}

class FutureBuilderWidgetState<T> extends State<FutureBuilderWidget<T>>
    with ErrorCallback {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildFutureBuilder(context);
  }

  ///默认加载界面
  final defaultLoading = Center(
    child: CircularProgressIndicator(),
  );

  ///默认出错界面
  Widget _defaultError(dynamic error) {
    return Center(
      child: Text(error.toString()),
    );
  }

  buildFutureBuilder(BuildContext context) {
    return new FutureBuilder(
      future: widget.loadData(context),
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;
          case ConnectionState.active:
          case ConnectionState.waiting:
            return new Container(
              child: widget.loadingWidget ??
                  new Center(
                    child: new CircularProgressIndicator(),
                  ),
            );

          case ConnectionState.done:
            debugPrint("done");
            if (snapshot.hasError) {
              if (widget.errorWidget != null) {
                if (widget.errorWidget is NetErrorWidget) {
                  return widget.errorWidget;
                } else {
                  //自定义界面显示内容
                  return NetErrorWidget(
                    errorChild: widget.errorWidget,
                    callback: this,
                  );
                }
              } else {
                // 默认错误界面
                return NetErrorWidget(
                  callback: this,
                  errorChild: _defaultError(snapshot.error),
                );
              }
            }
            break;
        }
        return widget.commonWidget.buildContainer(snapshot.data);
      },
    );
  }

  @override
  void retryCall() {
    // TODO: implement retryCall
  }
}
//
//class Data {
//}

class FutureBuilderDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FutureBuilderState();
  }
}

class _FutureBuilderState extends State<FutureBuilderDemo> with ErrorCallback {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar: AppBar(title: Text('FutureBuilder控件封装'),),
      body: FutureBuilderWidget<CourseDetail>(
          commonWidget: CommonWidget(), loadData: getRes),
    );
  }

  Future<CourseDetail> getRes(BuildContext context) async {
    var dio = new Dio();

//    https://online.acucom.net:6443/rest/otstudent/mobile/course/5d413f6a99b8870037474035/detail"
    var courseId = "5d413f6a99b8870037474035";

//    Options options = new Options(method: "GET",)
    Response<String> course = await dio.get("http://192.168.80"
        ".102:16255/rest/otstudent_v1/mobile/course/$courseId/detail");
    var jsonDecode = Convert.jsonDecode(course.data);

    var courseDetailJson = jsonDecode['data'];
    print('$courseDetailJson');
//    print('res::::${course.data}');
    var courseDetail = CourseDetail.fromJson(courseDetailJson);
    print('courseDetail:::::::$courseDetail');
    return courseDetail;
  }

  @override
  void retryCall() {
    // TODO: implement retryCall
    print('retryCall');
  }
}

///实现抽象方法，直接给界面复制

class CommonWidget extends NetNormalWidget<CourseDetail> {
  @override
  Widget buildContainer(CourseDetail courseDetail) {
    return TestPage1(courseDetail);
  }
}
