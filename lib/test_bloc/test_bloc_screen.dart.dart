//import 'package:flutter_demo/presentation/presentation.dart';
//import 'package:flutter/widgets.dart';
//
//import 'test_bloc_actions.dart';
//import 'test_bloc_bloc.dart';
//import 'test_bloc_state.dart';
//
//class TestBlocScreen extends StatefulWidget {
//  @override
//  _TestBlocScreenState createState() => _TestBlocScreenState();
//}
//
//class _TestBlocScreenState extends State<TestBlocScreen> {
//  TestBlocBloc _bloc;
//
//  @override
//  void initState() {
//    super.initState();
//    _bloc = TestBlocBloc();
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
//    return BlocStreamBuilder<TestBlocState>(
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
