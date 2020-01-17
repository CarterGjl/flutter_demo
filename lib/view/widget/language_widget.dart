import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/view/view_model/locale_view_model.dart';
import 'package:provider/provider.dart';

class LanguageWidget extends StatelessWidget {
  LocaleViewModel currentLocale;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    _buildLanguageItem(String la, Locale value) {
      return ListTile(
        title: Text(
          la,
          style: TextStyle(
              color:
                  currentLocale.currentLocale.languageCode == value.languageCode
                      ? color
                      : null),
        ),
        trailing: currentLocale.currentLocale.languageCode == value.languageCode
            ? Icon(
                Icons.done,
                color: color,
              )
            : null,
        onTap: () {
          currentLocale.changeLocale(value);
        },
      );
    }

    // TODO: implement build
    currentLocale = Provider.of<LocaleViewModel>(context);
    return ListView(
      children: <Widget>[
        _buildLanguageItem("中文简体", new Locale('zh', 'CN')),
        _buildLanguageItem("English", new Locale('en', 'US')),
        _buildLanguageItem("Auto", null),
      ],
    );
  }
}
