import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/mvvm/rx/rx_view_model.dart';

class ViewModelProvider<T extends BaseViewModel> extends StatefulWidget{

final T viewModel;
final Widget child;

ViewModelProvider({Key key,@required this.viewModel,@required this.child}) : super
(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ViewModelProviderState();
  }

  static T of<T extends BaseViewModel>(BuildContext context){
    var type = _typeOf<ViewModelProvider<T>>();
    ViewModelProvider<T> viewModelProvider = context.ancestorWidgetOfExactType
      (type);
    return viewModelProvider.viewModel;
  }

  static Type _typeOf<T>()=>T;
}

class _ViewModelProviderState extends State<ViewModelProvider> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.child;
  }
  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }
}