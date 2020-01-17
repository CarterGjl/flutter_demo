import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class ApiDio {
  static ApiDio instance;
  static ApiService apiService;
  Dio dio;

  ApiDio() {
    var options = new BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 3000,
        baseUrl: '',
        contentType: ContentType('application', 'x-www-form-urlencoded', charset: 'utf-8'));
    dio = new Dio(options);
    dio.interceptors.add(AuthInterceptor());
    dio
      ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
//    dio.interceptors.add(ResponseInterceptor());
    apiService = new ApiService(dio);
  }

  static ApiService getInstance({String baseUrl}) {
//    if (instance == null) {
////      instance = new ApiDio();
////    }
    instance ??= new ApiDio();
    if (baseUrl == null) {
      instance._normal();
    } else {
      instance._baseUrl(baseUrl);
    }
    return _getApiService();
  }

  static _getApiService() {
    return apiService;
  }

  _normal() {
    if (dio != null) {
      dio.options.baseUrl = '';
    }
  }

  _baseUrl(String baseUrl) {
    if (dio != null) {
      dio.options.baseUrl = baseUrl;
    }
  }
}

class AuthInterceptor extends Interceptor {
  String PLATFORM = "android"; //可根据代码进行判断
  String CLIENT = "store";

  @override
  onRequest(RequestOptions options) async {
    Map<String, String> headers = new Map();
    headers["Accept-Charset"] = "utf-8";
    headers["Connection"] = "keep-alive";
    headers["Accept"] = "*/*";
//    headers["x-version"] = TTicarConfig.VERSION_NAME;//自己更改配置
    headers["x-platform"] = PLATFORM;
    headers["x-client"] = CLIENT;
//    headers["x-equCode"] = TTicarConfig.equCode;//自己更改配置
//    headers["Authorization"] = TTicarConfig.TOKEN;//自己更改配置

    options.headers = headers;
    return super.onRequest(options);
  }
}

class ApiService {
  Dio dio;

  ApiService(this.dio);

  Future getF<T>(String url, {Map<String, dynamic> params}) async {
    Response<String> response = await dio.get(url, queryParameters: params);
    return response.data;
  }

  Future postF<T>(String url, {Map<String, dynamic> params}) async {
    var response = await dio.post(url, data: params);
    return response.data;
  }

  Observable post(String url, {Map<String, dynamic> params1}) =>
      Observable.fromFuture(postF(url, params: params1)).asBroadcastStream();

  Observable get(String url, {Map<String, dynamic> params}) =>
      Observable.fromFuture(getF(url, params: params));
}

class ResponseInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) {}

  @override
  onError(DioError err) {}

  @override
  onResponse(Response response) {
    RequestOptions option = response.request;
//    try {
    if (option.contentType != null &&
        option.contentType.primaryType == "text") {
      return new ResultData(response.data, true, 1);
    }

    ///一般只需要处理200的情况，300、400、500保留错误信息
    if (response.statusCode == 200 || response.statusCode == 201) {
      int code = response.data["code"];
      if (code == 0) {
        return new ResultData(response.data, true, 1,
            headers: response.headers);
      } else if (code == 100006 || code == 100007) {
      } else {
//          Fluttertoast.showToast(msg: response.data["msg"]);
        return new ResultData(response.data, false, 1,
            headers: response.headers);
      }
    }
//    } catch (e) {
//      print(e.toString() + option.path);

    return new ResultData(response.data, false, response.statusCode,
        headers: response.headers);
//    }

//    return new ResultData(response.data, false, response.statusCode,
//        headers: response.headers);
  }
}

class ResultData {
  var data;
  bool isSuccess;
  int code;
  var headers;

  ResultData(this.data, this.isSuccess, this.code, {this.headers});
}
