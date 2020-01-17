//import 'package:flutter_demo/presentation/presentation.dart';
//import 'package:flutter/widgets.dart';
//
//import 'counter_actions.dart';
//import 'counter_bloc.dart';
//import 'counter_state.dart';
//
//class CounterScreen extends StatefulWidget {
//  @override
//  _CounterScreenState createState() => _CounterScreenState();
//}
//
//class _CounterScreenState extends State<CounterScreen> {
//  CounterBloc _bloc;
//
//  @override
//  void initState() {
//    super.initState();
//    _bloc = CounterBloc();
//  }
//
//  @override
//  void dispose() {
//    _bloc.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return BlocStreamBuilder<CounterState>(
//      controller: _bloc.controller,
//      builder: (context, state) {
//        return _buildUI(state);
//      },
//    );
//  }
//
//  Widget _buildUI(AlertsState state) {
//    return Container();
//  }
//}
