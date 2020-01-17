import 'dart:async';

class CountBlocs{

  int _count = 0;
  StreamController<int> _controller = new StreamController.broadcast();
//
//  CountBloc(){
//    _count = 0;
//    _controller = new StreamController();
//  }

  int get value => _count;

  Stream<int> get stream => _controller.stream;
  increment(){
    _controller.sink.add(++_count);
  }

  dispose(){
    _controller.close();
  }
}