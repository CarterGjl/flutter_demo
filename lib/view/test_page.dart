import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('text'),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: new Container(
                height: 40,
                child: Text('data'),
              ),
            ),
            SliverToBoxAdapter(
              child: new Container(
                height: 40,
                child: Text('data'),
              ),
            ),
            SliverToBoxAdapter(
              child: new Container(
                height: 40,
                child: Text('data'),
              ),
            ),
            SliverToBoxAdapter(
              child: new Container(
                height: 40,
                child: Text('data'),
              ),
            )
          ];
        },
        body: new DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                TabBar(tabs: [
                  new Container(
                    child: new Text('tex1'),
                  ),
                  new Container(
                    child: new Text('tex2'),
                  )
                ]),
                Expanded(
                  child: TabBarView(children: [
//                    new Container(
//                      alignment: Alignment.center,
//                      child: new Text('发的说法是否'),
//                    ),
                  new CustomScrollView(
                    slivers: <Widget>[
//
//                      new SliverOverlapInjector(handle: NestedScrollView
//                          .sliverOverlapAbsorberHandleFor(context)),
                      SliverToBoxAdapter(
                        child: new Container(
                          child: Text('测试测试'),
                        ),
                      )
                    ],
                  ),
//                    new Builder(builder: (BuildContext context) {
//                      return new CustomScrollView(
//                        slivers: <Widget>[
////                          new SliverOverlapInjector(
////                              handle: NestedScrollView
////                                  .sliverOverlapAbsorberHandleFor(context)),
////                          SliverList(
////                            delegate: SliverChildBuilderDelegate(
////                                (BuildContext context, int index) {
////                              return Text('$index');
////                            }, childCount: 10),
////                          )
//                        SliverToBoxAdapter(
//                          child: new Container(
//                            child: new Text('name'),
//                          ),
//                        )
//                        ],
//                      );
//                    }),
                    new Container(
                      alignment: Alignment.center,
                      child: new Text('tdfasfadsedaffdasx1'),
                    ),
                  ]),
                )
              ],
            )),
      ),
    );
  }
}
