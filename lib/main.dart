import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'pages/to_do_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {

  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],

    supportedLocales: [
      //todo добавить перевод с русского на английский в файл app_en.ard
      // Locale('en', ''),
      Locale('ru', ''),
    ],

    //title: AppLocalizations.of(context)!.helloWorld,
    theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: TextTheme(
            // center text style
            caption: TextStyle(color: Colors.white),
            // Side text style
            bodyText2: TextStyle(color: Colors.white))),
    home: ToDoPage(),
  ));
}
