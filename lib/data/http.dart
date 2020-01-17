import 'dart:convert' as Convert;

import 'package:dio/dio.dart';

class HttpClient {
  Dio dio;
  BaseOptions baseOptions;

  HttpClient({String baseUrl = '', Map<String, dynamic> header}) {
    baseOptions = new BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 10000,
        responseType: ResponseType.plain,
        receiveTimeout: 3000,
        headers: header);
    dio = new Dio(baseOptions);
//    dio.interceptors.add(CookieManager(CookieJar()));
  }

  Future get(url, {data, options, cancelToken}) async {
    print('get请求启动 url $url ,body:$data');
    Response response;
    response = await dio.get(url, cancelToken: cancelToken);
    var jsonDecode = Convert.jsonDecode(response.data);
    var code = jsonDecode['code'];
    if (code == 1) {
      return response.data;
    }
    return Future.error('http get error');
  }

  Future post(url, {data, options, cancelToken}) async {
    print('post请求启动! url：$url ,body: $data');
    Response response;
      response = await dio.post(
        url,
        data: data,
      );
      print('post请求成功!response.data：${response.data}');

    return response.data;
  }
}
