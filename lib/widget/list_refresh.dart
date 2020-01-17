import 'package:flutter/material.dart';

class ListRefresh extends StatefulWidget {
  final headerView;
  final renderItem;

  const ListRefresh(this.headerView, this.renderItem);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ListRefreshState();
  }
}

class _ListRefreshState extends State<ListRefresh> {
  var _scrollController = new ScrollController();
  List items = new List();

  @override
  void initState() {
    _getMoreData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RefreshIndicator(
      child: new ListView.builder(
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index == 0 /* && index != items.length*/) {
            if (widget.headerView is Function) {
              return widget.headerView();
            } else {
              return Container(height: 0);
            }
          }
          if (index == items.length) {
            return _buildProgressIndicator();
          } else {
            if (widget.renderItem is Function) {
              return widget.renderItem();
            } else {
              return new Container(
                height: 0,
              );
            }
          }
        },
        controller: _scrollController,
      ),
      onRefresh: (){
        print('onRefresh');
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _getMoreData() {
    setState(() {
      items.add(1);
      items.add(2);
    });
  }

  Widget _buildProgressIndicator() {}

  Future<void> _handleRefresh() async {}
}
