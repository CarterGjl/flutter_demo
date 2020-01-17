import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/mvvm/imp/home_view_model.dart';
import 'package:flutter_demo/mvvm/rx/view_model_provider.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomeState();
  }

}

class _HomeState extends State<HomePage> {
  CourseDetailViewModel viewModel;
  @override
  void initState() {
    viewModel = ViewModelProvider.of(context);
    viewModel.init(context);
    super.initState();
  }
  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text('flutter mvvm的示例'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            StreamBuilder(
//              stream: viewModel.dataStream,
//                builder: (BuildContext context, AsyncSnapshot<String>
//            snapshot){
//              if
//            })
            )
          ],
        ),
      ),
    );
  }
}