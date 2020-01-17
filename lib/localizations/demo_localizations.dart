import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations>{


  static DemoLocalizationsDelegate of(BuildContext context){
    return Localizations.of<DemoLocalizationsDelegate>(context, DemoLocalizationsDelegate);
  }



  @override
  bool isSupported(Locale locale) {
    return ['en','zh'].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalizations> load(Locale locale) {
    return SynchronousFuture<DemoLocalizations>(DemoLocalizations(locale.languageCode=='zh'));
  }

  @override
  bool shouldReload(LocalizationsDelegate<DemoLocalizations> old) {
    return false;
  }

}
class DemoLocalizations{

  bool isZh = false;

  DemoLocalizations(this.isZh);
  String get title{
    return isZh?'flutter 应用':'Flutter app';
  }
  String get title1{
    return Intl.message(
      'flutter app',
      name: 'title',
      desc: 'title for the demo application'
    );
  }
}