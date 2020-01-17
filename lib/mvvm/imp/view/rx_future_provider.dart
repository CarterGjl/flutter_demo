import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/data/course_entity.dart';
import 'package:flutter_demo/main.dart';
import 'package:flutter_demo/mvvm/imp/home_view_model.dart';
import 'package:flutter_demo/mvvm/rx/rx_view_model.dart';
import 'package:flutter_demo/mvvm/rx/view_model_provider.dart';

//封装了 loading success 等状态集成了 streambuilder
class RxFutureBuilderWidgetState<T, VM extends BaseViewModel<T>>
    extends State<RxFutureBuilderWidget<T, VM>> with ErrorCallback {
  @override
  Widget build(BuildContext context) {
    return buildFutureBuilder(context);
  }

//viewmodel 包含返回数据类型
  VM viewModel;

  @override
  void initState() {
    viewModel = ViewModelProvider.of(context);
    viewModel.init(context);
    super.initState();
  }

  ///默认加载界面
  final defaultLoading = Center(
    child: CircularProgressIndicator(),
  );

  ///默认出错界面
  Widget _defaultError(dynamic error) {
    return Center(
      child: Text(error.toString()),
    );
  }

  buildFutureBuilder(BuildContext context) {
    return new StreamBuilder(
      stream: viewModel.dataStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Container(
              child: widget.loadingWidget ?? defaultLoading,
            );
          case ConnectionState.active:
          case ConnectionState.done:
            debugPrint("done");
            if (snapshot.hasError) {
              if (widget.errorWidget != null) {
                if (widget.errorWidget is NetErrorWidget) {
                  return widget.errorWidget;
                } else {
                  //自定义界面显示内容
                  return NetErrorWidget(
                    errorChild: widget.errorWidget,
                    callback: this,
                  );
                }
              } else {
                // 默认错误界面
                return NetErrorWidget(
                  callback: this,
                  errorChild: _defaultError(snapshot.error),
                );
              }
            }
            break;
        }
        return widget.commonWidget.buildContainer(snapshot.data);
      },
    );
  }

  @override
  void retryCall() {}
}

///FutureBuilder的future传的内容
typedef LoadDataFuture<T> = Future<T> Function(BuildContext context);

abstract class NetNormalWidget<T> extends StatelessWidget {
  final T bean; //通用数据类

  NetNormalWidget({this.bean});

  @override
  Widget build(BuildContext context) {
    return buildContainer(bean);
  }

  ///给定义Widget赋值
  Widget buildContainer(T t);
}

class FutureBuilderWidget<T, R extends BaseViewModel<T>>
    extends StatefulWidget {
  final Widget loadingWidget;
  final Widget errorWidget;
  final NetNormalWidget<T> commonWidget;
  final LoadDataFuture<T> loadData;

  FutureBuilderWidget(
      {this.loadingWidget,
      this.errorWidget,
      @required this.commonWidget,
      @required this.loadData});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RxFutureBuilderWidgetState<T, R>();
  }
}

///net出错 回调
abstract class ErrorCallback {
  void retryCall();
}

///网络请求 失败 Widget
class NetErrorWidget extends StatelessWidget {
  final Widget errorChild;
  final ErrorCallback callback;

  NetErrorWidget({@required this.errorChild, this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: errorChild,
      onTap: () => callback?.retryCall(),
    );
  }
}

class RxFutureBuilderWidget<T, R extends BaseViewModel<T>>
    extends StatefulWidget {
  final Widget loadingWidget;
  final Widget errorWidget;
  final NetNormalWidget<T> commonWidget;

  RxFutureBuilderWidget(
      {this.loadingWidget, this.errorWidget, @required this.commonWidget});

  @override
  State<StatefulWidget> createState() {
    return new RxFutureBuilderWidgetState<T, R>();
  }
}

///shijian
class RxMvvmApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'rx mvvm',
      theme: ThemeData(
          primarySwatch: Colors.blue,
//        platform: TargetPlatform.iOS
      ),
      home: new Scaffold(
        body: ViewModelProvider(
          viewModel: new CourseDetailViewModel(),
          child: new RxFutureBuilderWidget<CourseDetail, CourseDetailViewModel>(
              commonWidget: CommonWidget()),
        ),
      ),
    );
  }
}

//success  widget show()
class CommonWidget extends NetNormalWidget<CourseDetail> {
  @override
  Widget buildContainer(CourseDetail courseDetail) {
    return TestPage1(courseDetail);
  }
}
