import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/generated/i18n.dart';
import 'package:flutter_demo/view/view_model/intercepert_data_model.dart';
import 'package:flutter_demo/view/view_model/locale_view_model.dart';
import 'package:flutter_demo/view/webview_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class WebviewApp extends StatelessWidget {
  Future getPermission() async {
    return await PermissionHandler().requestPermissions(
        [PermissionGroup.camera, PermissionGroup.microphone]);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    getPermission().then((value) {
      log("getPermission:$value");
    }).catchError((error) {
      log('getPermission ::$error');
    });
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) {
            var interceptrDataModel = InterceptrDataModel();
            interceptrDataModel.getInterceptDataC();
            return interceptrDataModel;
          },
        ),
        ChangeNotifierProvider(
          builder: (_) {
            return new LocaleViewModel();
          },
        )
      ],
      child: Consumer<InterceptrDataModel>(builder: (context, data, _) {
        return MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          locale: Provider.of<LocaleViewModel>(context).currentLocale,
          supportedLocales: S.delegate.supportedLocales,
//          home: WebViewPage('http://online.lzr.com/ot/index.html'),
          home: WebViewPage("www.baidu.com"),
        );
      }),
    );
  }
}
