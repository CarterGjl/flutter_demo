import 'dart:developer' as prefix0;

import 'package:flutter_demo/data/rxhttp.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntercetpRepositry {
  Observable getInterceptDataFromLocal() {
    return Observable.fromFuture(getLocal());
  }

getLocal() async {
  var sharedPreferences = await SharedPreferences.getInstance();
  var string = sharedPreferences.getString('intercept_data');
  prefix0.log('get from local $string');
  return string;
}

Observable getInterceptDataFromNet() {
  return ApiDio.getInstance().get('http://192.168.80'
      '.186:10055/rest/otstudent_v1/mobile/notforward/url');
}
}
