import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/view/intercept_repositrie.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../intercept_data.dart';

class InterceptrDataModel extends ChangeNotifier {
  static List<String> _dataUrl = [
    "/ot/ssohandler.html",
    "/order/status.html",
    "/order/confirm.html",
    "/aculearn-idm/v4/opr/studioclient.asp",
    "/aculearn-idm/v4/opr/studioclient.asp",
    "/ot/video/player.html"
  ];
  InterceptData _interceptData = new InterceptData(data: _dataUrl);
  IntercetpRepositry inter = new IntercetpRepositry();

  InterceptData get interceptData => _interceptData;

  save(String value) async {
    log('save value $value');
    var instance = await SharedPreferences.getInstance();
    instance.setString('intercept_data', value);
  }

  getInterceptDataC() {
    inter.getInterceptDataFromLocal().flatMap((value) {
      if (value != null) {
        log('get data from Local :$value');
        value = value as String;
        var decode = json.decode(value);
        log("decode :$decode");
        var interceptData = InterceptData.fromJson(decode);
        _interceptData = interceptData;
        notifyListeners();
      }
      return inter.getInterceptDataFromNet();
    }).listen((value) {
      log("get intercept data from net :$value");
      if (value == null) {
        return;
      }
      value = value as String;
      var decode = json.decode(value);
      log("decode :$decode");
      var interceptData = InterceptData.fromJson(decode);
      if (interceptData?.data == null || interceptData.code != 1) {
        return;
      }
      _interceptData = interceptData;
      save(value);
      notifyListeners();
    });
  }

  getInterceptData() {
    Observable.merge([
      inter.getInterceptDataFromLocal(),
      inter.getInterceptDataFromNet()
    ]).listen((value) {
      log("get intercept data from net :$value");
      if (value == null) {
        return;
      }
      value = value as String;
      var decode = json.decode(value);
      log("decode :$decode");
      var interceptData = InterceptData.fromJson(decode);
      if (interceptData?.data == null || interceptData.code != 1) {
        return;
      }
      _interceptData = interceptData;
      save(value);
      notifyListeners();
    }).onError((error) {
      log('error occure :::$error');
    });
//    ApiDio.getInstance()
//        .getF('https://online.yyf.com/rest/otstudent/mobile/notforward/url')
//        .then((result) {
//      var decode = json.decode(result);
//      var interceptData = InterceptData.fromJson(decode);
//      _interceptData = interceptData;
//      notifyListeners();
//    }).catchError((error) {
//      log(error);
//    });
  }
}
