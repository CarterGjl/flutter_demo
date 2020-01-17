import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/mvvm/rx/view_model_provider.dart';
import 'package:flutter_demo/theme_change/theme_model.dart';

class ThemeChangePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text('change theme'),
      ),
      body: new Column(
        children: <Widget>[
          RaisedButton(
              child: new Text('dark'),
              onPressed: () {
                ViewModelProvider.of<ThemeModel>(context)
                    .changeTheme(ThemeData.dark());
              }),
          RaisedButton(
              child: new Text('light'),
              onPressed: () {
                ViewModelProvider.of<ThemeModel>(context)
                    .changeTheme(ThemeData.light());
              })
        ],
      ),
    );
  }
}
