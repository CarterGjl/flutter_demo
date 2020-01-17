import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel<T> {
  @protected
  var dataObservable;

  @protected
  BehaviorSubject<T> initObservable();

  Stream<T> get dataStream => dataObservable?.stream;

  bool _isFirst = true;

  bool get isFirst => _isFirst;

  @mustCallSuper
  void init(BuildContext context) {
//    if (dataObservable == null) {
    dataObservable ??= initObservable();
//    }
    if (_isFirst) {
      _isFirst = false;
      doInit(context);
    }
  }

  @protected
  Future refreshData(BuildContext context);

  @protected
  void doInit(BuildContext context);

  void dispose() {
    dataObservable.close();
  }
}
