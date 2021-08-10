import 'package:flutter/material.dart';
import 'pages/to_do_page.dart';
void main() {


  runApp(
    new MaterialApp(
      title: 'Title all application',
      theme: new ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: ToDoPage(),

    )
  );
}
