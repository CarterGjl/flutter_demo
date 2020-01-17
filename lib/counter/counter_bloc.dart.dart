//import 'package:flutter_demo/presentation/presentation.dart';
//
//import 'counter_actions.dart';
//import 'counter_state.dart';
//
//class CounterBloc {
//  BlocController<CounterState, Action> get controller => _core;
//  BlocCore<CounterState, CounterStateBuilder, Action> _core;
//
//  CounterBloc() {
//    _core = BlocCore<CounterState, CounterStateBuilder, Action>(
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
//  CounterStateBuilder _initializeStateBuilder() {
//    return CounterStateBuilder();
//  }
//
//  CounterState _initializeState(CounterStateBuilder builder) {
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
