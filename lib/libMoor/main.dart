import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/blocs/todo.dart';
import 'src/database/database.dart';
import 'ui/home/screen.dart';
import 'package:sqlite3/open.dart';

void main() {
  //setTargetPlatformForDesktop(platform: TargetPlatform.windows);
  //open.overrideFor(OperatingSystem.windows, _openOnLinux);

  runApp(MyApp());
}
DynamicLibrary _openOnLinux() {
  final scriptDir = File(Platform.script.toFilePath()).parent;
 // final libraryNextToScript = File('${scriptDir.path}/lib/sqlite3.dll');
  //final libraryNextToScript =File("C:\\Users\\neo32\\IdeaProjects\\synccards\\lib\\sqlite3.dll");
//  return DynamicLibrary.open(libraryNextToScript.path);
  return DynamicLibrary.open("C:/Users/neo32/IdeaProjects/synccards/lib/sqlite3.dll");
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //todo RepositoryProvider - какой-то провайдер надо разобраться
    return RepositoryProvider<Database>(
      create: (context) => constructDb(),
      //todo BlocProvider - блок провайдер является р
      child: BlocProvider<TodoAppBloc>(
        create: (context) {
          final db = RepositoryProvider.of<Database>(context);
          return TodoAppBloc(db);
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'moor Demo',
          theme: ThemeData(
            primarySwatch: Colors.orange,
            // use the good-looking updated material text style
            typography: Typography.material2018(
              englishLike: Typography.englishLike2018,
              dense: Typography.dense2018,
              tall: Typography.tall2018,
            ),
          ),
          home: HomeScreen(),
        ),
      ),
    );
  }
}
