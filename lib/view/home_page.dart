import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<String> tabNames = [];
  List<BottomItem> bottomTabs = [];
  List<Widget> pages = [];
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    var loadString =
        DefaultAssetBundle.of(context).loadString('assets/swordsmen.json');

    loadString.then((value) {
      print('本地json$value');
    }).catchError((error) {
      print('加载错误"$error');
    });
//    new Timer(new Duration(seconds: 1), () {
//      print('timer');
//      pageController.animateTo((index + 1) * MediaQuery.of(context).size.width,
//          duration: new Duration(milliseconds: 500), curve: Curves.linearToEaseOut);
//    });
    return DefaultTabController(
      child: new Scaffold(
        appBar: new AppBar(
          title: Text('Courses'),
          bottom: _selectIndex == 0
              ? TabBar(
                  isScrollable: true,
                  tabs: tabNames.map((tab) {
                    return new Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(8),
                        child: new Text(tab));
                  }).toList()

//          <Widget>[
//            tabNames.map()
//            new Container(
//                alignment: Alignment.center,
//                padding: EdgeInsets.all(8),
//                child: new Text('All')),
//            new Container(
//              alignment: Alignment.center,
//              padding: EdgeInsets.all(8),
//              child: new Text('Math'),
//            ),

                  )
              : null,
        ),
        body: pages[_selectIndex],
        bottomNavigationBar: new BottomNavigationBar(
          items: bottomTabs.map((tab) {
            return new BottomNavigationBarItem(
                icon: new Icon(tab.icon), title: Text(tab.tabName));
          }).toList(),
          currentIndex: _selectIndex,
          onTap: (index) {
            setState(() {
              _selectIndex = index;
            });
          },
        ),
      ),
      length: tabNames.length,
    );
  }

  PageController pageController;
  var index = 0;

  @override
  void initState() {
    super.initState();

    pageController = PageController();
    tabNames.add('All');
    tabNames.add('Math');
    tabNames.add('Since');
    tabNames.add('Thai');
    tabNames.add('Physical');
    tabNames.add('Chinese');
    var bottomItem = new BottomItem('Course', Icons.home);
    bottomTabs.add(bottomItem);
    var bottomItemq1 = new BottomItem('MyCourse', Icons.tab);
    bottomTabs.add(bottomItemq1);
    var bottomItemq2 = new BottomItem('Me', Icons.assignment_ind);
    bottomTabs.add(bottomItemq2);

    pages.add(TabBarView(
      children: tabNames.map((tab) {
        return new Container(
          alignment: Alignment.center,
          child: new CustomScrollView(
            physics: new BouncingScrollPhysics(),
            shrinkWrap: true,
            slivers: <Widget>[
              new SliverToBoxAdapter(
                child: Container(
                  width: 500,
                  padding: EdgeInsets.all(15),
                  height: 200,
                  child: Swiper(
                    control: new SwiperControl(),
                    autoplay: true,
                    itemCount: 5,
                    viewportFraction: 0.8,
                    scale: 0.9,
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: new Image.asset(
                          'images/lake.jpg',
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
//                  child: PageView.custom(
//                    controller: pageController,
//                    pageSnapping: true,
//                    childrenDelegate: new SliverChildBuilderDelegate(
//                        (BuildContext context, int index) {
//                      return Container(
//                        margin: EdgeInsets.all(8),
//                        child: ClipRRect(
//                          borderRadius: BorderRadius.circular(16),
//                          child: new Image.asset(
//                            'images/lake.jpg',
//                            fit: BoxFit.cover,
//                          ),
//                        ),
//                      );
//                    }),
//                  ),
                ),
              ),
//              new SliverToBoxAdapter(
//                child: Container(
//                  width: 500,
//                  height: 300,
//                  child: ListView.builder(
//                      scrollDirection: Axis.horizontal,
//                      shrinkWrap: true,
//                      itemCount: 5,
//                      itemBuilder: (BuildContext context, int index) {
//                        return Container(
//                          margin: EdgeInsets.all(8),
//                          child: ClipRRect(
//                            borderRadius: BorderRadius.circular(16),
//                            child: new Image.asset(
//                              'images/lake.jpg',
//                              fit: BoxFit.cover,
//                            ),
//                          ),
//                        );
//                      }),
//                ),
//              ),
              new SliverList(
                  delegate: new SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
                  child: InkWell(
                    onTap: () {
                      print('tap tap');
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Eighth grade geography : Common celestial system',
                            style: TextStyle(fontSize: 15),
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: RatingBar(5.0)),
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: new NetworkImage(
                                    "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3463668003,3398677327&fm=58"),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Teacher Wang',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        '\$1.0',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.orangeAccent),
                                      ),
                                      Text('12 participant(s)')
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }, childCount: 5)),
            ],
          ),
        );
      }).toList(),
      physics: new BouncingScrollPhysics(),
    ));
    pages.add(new Container(
      child: Text('MyCourses'),
    ));
    pages.add(new Container(
      child: new Text('Me'),
    ));
//    pages.add('MyCoures');
//    pages.add('Me');
  }
}

class BottomItem {
  String tabName;
  IconData icon;

  BottomItem(this.tabName, this.icon);
}

class MePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MePageState();
  }
}

class MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: new NetworkImage(
                  "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3463668003,3398677327&fm=58"),
            ),
            Expanded(
              child: Column(
                children: <Widget>[Text('Wang Xiaoming'), Text('Grade One')],
              ),
            ),
            new IconButton(
                icon: new Icon(Icons.arrow_forward_ios), onPressed: () {})
          ],
        )
      ],
    );
  }
}
