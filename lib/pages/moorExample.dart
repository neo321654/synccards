import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:synccards/database/bloc.dart';
import 'package:synccards/widget/moor/homescreen.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<TodoAppBloc>(
      create: (_) => TodoAppBloc(),
      dispose: (_, bloc) => bloc.close(),
      child: MaterialApp(
        title: 'moor Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          typography: Typography.material2018(),
        ),
        home: HomeScreenMoor(),
      ),
    );
  }
}