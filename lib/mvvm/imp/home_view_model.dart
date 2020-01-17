import 'dart:convert' as Convert;

import 'package:flutter/material.dart';
import 'package:flutter_demo/data/course_entity.dart';
import 'package:flutter_demo/data/rxhttp.dart';
import 'package:flutter_demo/mvvm/rx/rx_view_model.dart';
import 'package:rxdart/subjects.dart';

class CourseDetailViewModel extends BaseViewModel<CourseDetail> {
  @override
  void dispose() {}

  @override
  void doInit(BuildContext context) {
    // TODO: implement doInit
    refreshData(context);
  }

  @override
  Future refreshData(BuildContext context) {
    var courseId = "5d413f6a99b8870037474035";
    return ApiDio.getInstance()
        .getF(
            'http://192.168.80.102:16255/rest/otstudent_v1/mobile/course/$courseId/detail')
        .then((data) {
      process(data);
    }).catchError((error) {
      dataObservable.add(error);
    });
  }

  void process(data) {
    var jsonDecode = Convert.jsonDecode(data);
    var courseDetailJson = jsonDecode['data'];
    var courseDetail = CourseDetail.fromJson(courseDetailJson);
    dataObservable.add(courseDetail);
  }

  @override
  BehaviorSubject<CourseDetail> initObservable() {
    // TODO: implement get
//    if (dataObservable == null) {
    dataObservable = BehaviorSubject<CourseDetail>();
//    }
    return dataObservable;
  }
}
