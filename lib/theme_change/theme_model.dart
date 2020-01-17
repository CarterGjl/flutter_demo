import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_demo/mvvm/rx/rx_view_model.dart';
import 'package:rxdart/src/subjects/behavior_subject.dart';
import 'package:rxdart/subjects.dart';

class ThemeModel extends BaseViewModel<ThemeData>{
  @override
  void doInit(BuildContext context) {
    // TODO: implement doInit
    dataObservable.add(ThemeData.light());
  }

  @override
  BehaviorSubject<ThemeData> initObservable() {
    // TODO: implement initObservable
    return new BehaviorSubject<ThemeData>();
  }

  @override
  Future refreshData(BuildContext context) {
    // TODO: implement refreshData
    return null;
  }

  changeTheme(ThemeData themeData){
    dataObservable.add(themeData);
  }

}