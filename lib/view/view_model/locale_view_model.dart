import 'package:flutter/cupertino.dart';

class LocaleViewModel extends ChangeNotifier{

  Locale _currentLocale = Locale('zh','CN');

  Locale get currentLocale => _currentLocale;

  void changeLocale(Locale locale){
    _currentLocale = locale;
    notifyListeners();
  }

}