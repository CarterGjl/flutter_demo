import 'package:flutter/cupertino.dart';

import 'count_bloc.dart';

class BlocProvider extends InheritedWidget {
  final CountBlocs blocs = CountBlocs();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static CountBlocs of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
        .blocs;
  }

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);
}
