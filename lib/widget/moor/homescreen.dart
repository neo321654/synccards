import 'package:flutter/material.dart' hide Column;
import 'package:flutter/widgets.dart' as f show Column;
import 'package:provider/provider.dart';
import 'package:synccards/database/bloc.dart';
import 'package:synccards/database/database.dart';
import 'package:synccards/widget/moor/todo_card.dart';

import 'categories_drawer.dart';

// ignore_for_file: prefer_const_constructors

class HomeScreenMoor extends StatefulWidget {
  @override
  HomeScreenMoorState createState() {
    return HomeScreenMoorState();
  }
}

/// Shows a list of todos and displays a text input to add another one
class HomeScreenMoorState extends State<HomeScreenMoor> {
  // we only use this to reset the input field at the bottom when a entry has
  // been added
  final TextEditingController controller = TextEditingController();

  TodoAppBloc get bloc => Provider.of<TodoAppBloc>(context, listen: false);


  @override
  Widget build(BuildContext context) {
    return Provider<TodoAppBloc>(
      create: (_) {
        return TodoAppBloc();
        },
      dispose: (_, bloc) => bloc.close(),
      builder: (context, widget) {

        return Scaffold(
          appBar: AppBar(
            title: Text('Todo list'),
          ),
          drawer: CategoriesDrawer(),
          bottomSheet: Material(
            elevation: 12,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: f.Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('What needs to be done?'),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: controller,
                            onSubmitted: (_) => _createTodoEntry(),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.send),
                          color: Theme.of(context).accentColor,
                          onPressed: _createTodoEntry,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: StreamBuilder<List<EntryWithCategory>>(
            stream: bloc.homeScreenEntries,
            builder: (context, snapshot) {
              print(snapshot);

              if (!snapshot.hasData) {
                return const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              }

              final activeTodos = snapshot.data;

              return ListView.builder(
                itemCount: activeTodos?.length,
                itemBuilder: (context, index) {
                  return TodoCard(activeTodos![index].entry);
                },
              );
            },
          ),
        );
      },
    );
  }

  void _createTodoEntry() {
    if (controller.text.isNotEmpty) {
      // We write the entry here. Notice how we don't have to call setState()
      // or anything - moor will take care of updating the list automatically.
      bloc.createEntry(controller.text);
      controller.clear();
    }
  }
}