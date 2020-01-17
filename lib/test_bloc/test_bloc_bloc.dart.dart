//import 'package:flutter_demo/presentation/presentation.dart';
//
//import 'test_bloc_actions.dart';
//import 'test_bloc_state.dart';
//
//class TestBlocBloc {
//  BlocController<TestBlocState, Action> get controller => _core;
//  BlocCore<TestBlocState, TestBlocStateBuilder, Action> _core;
//
//  TestBlocBloc() {
//    _core = BlocCore<TestBlocState, TestBlocStateBuilder, Action>(
//      stateBuilderInitializer: _initializeStateBuilder,
//      stateInitializer: _initializeState,
//      dispatcher: _dispatch,
//    );
//  }
//
//  void dispose() {
//    _core.dispose();
//  }
//
//  TestBlocStateBuilder _initializeStateBuilder() {
//    return TestBlocStateBuilder();
//  }
//
//  TestBlocState _initializeState(TestBlocStateBuilder builder) {
//    return builder.build();
//  }
//
//  void _dispatch(Action action) {
//    switch (action.runtimeType) {
//      default:
//        assert(false);
//    }
//  }
//}
