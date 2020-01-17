import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {
  final int data;

  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.data != data;
  }
}

class TestWidgetForShare extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TestWidgetState();
  }
}

class TestWidgetState extends State<TestWidgetForShare> {
  @override
  Widget build(BuildContext context) {
    return new Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    print('dependencies change');
    super.didChangeDependencies();
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new InheritedWidgetTestRouteState();
  }
}

class InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: ShareDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: TestWidgetForShare(),
            ),
            new RaisedButton(
              onPressed: () {
                setState(() {
                  ++count;
                });
              },
              child: new Text('increment'),
            )
          ],
        ),
      ),
    );
  }
}
