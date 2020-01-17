import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/blocim/bloc_provider.dart';

class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: Text('top page'),
      ),
      body: Center(
        child: StreamBuilder(
            stream: bloc.stream,
            initialData: bloc.value,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text('you hit me :${snapshot.data} times');
            }),
      ),
      floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return new UnderPage();
            }));
          }),
    );
  }
}

class UnderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var countBLoC = BlocProvider.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: Text('under page'),
      ),
      body: Center(
        child: new StreamBuilder(
            stream: countBLoC.stream,
            initialData: countBLoC.value,
            builder: (context, snapshot) =>
                new Text('you hit me ${snapshot.data} times')),
      ),
    );
  }
}
