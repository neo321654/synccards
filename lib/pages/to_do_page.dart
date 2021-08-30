import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:synccards/bloc/color_bloc.dart';
import 'package:synccards/database/bloc.dart';
import 'package:synccards/model/bloc/user_bloc.dart';
import 'package:synccards/model/bloc/user_event.dart';
import 'package:synccards/model/bloc/user_state.dart';
import 'package:synccards/services/user_repository.dart';
import 'package:synccards/widget/drawer.dart';
import 'package:synccards/utils/utilsFunctions.dart';
import 'package:synccards/widget/list_item.dart';
import 'package:synccards/widget/moor/homescreen.dart';
import 'package:synccards/widget/my_voluem_button.dart';

import 'detail_item_page.dart';
import 'flutter_bloc_page.dart';

class ToDoPage extends StatefulWidget {
  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> with TickerProviderStateMixin {
  String? nameProject;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(
      reverse: true,
    );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(word(context).helloWorld);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: AppDrawer(),
          appBar: AppBar(
            title: Column(
              children: [
                Text(
                  word(context).targetProgect,
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  nameProject ?? word(context).nameProgect,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
            centerTitle: true,
            actions: [MyVolumeButton()],
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.format_list_numbered_sharp),
                  text: word(context).todo,
                ),
                Tab(
                  icon: Icon(Icons.done),
                  text: word(context).done,
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BlocProvider<UserBloc>(
                create: (context) {
                  UsersRepository usersRepository = UsersRepository();
                  return UserBloc(usersRepository: usersRepository);
                },
                child: ToDoList(),
              ),

              // SlidableExample(title: "TitleExample"),
              // HomeScreenMoor(),
              BlocProvider<ColorBloc>(
                  create: (context) => ColorBloc(Colors.red),
                  child: FlutterBlocPage())
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            //backgroundColor: _fabColor,
            onPressed: () {},
            child: RotationTransition(
              turns: _animation,
              child: Icon(Icons.add),
            ),
          )),
    );
  }
}

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List tasksList = [];

  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final item = tasksList.removeAt(oldindex);
      tasksList.insert(newindex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserLoadedState) {
        tasksList = state.loadedUser;
        print("${tasksList.toString()}");

        return ReorderableListView(
            buildDefaultDragHandles: false,
            onReorder: reorderData,
            children: [
              //   for (final item in items)
              for (int index = 0; index < tasksList.length; index++)
                Dismissible(
                  key: Key(tasksList[index].id.toString()),
                  child: SizedBox(
                    child: Card(
                      elevation: 3,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Hero(
                                tag: "iconHero",
                                child: IconButton(
                                  color: Colors.blue,
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const DetailItemPage();
                                    }));
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                      "${tasksList[index].name}  order: ${tasksList[index].order} ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  Text("${tasksList[index].description}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6),
                                ],
                              ),
                            ),
                            Center(
                              child: ReorderableDragStartListener(
                                index: index,
                                child: IconButton(
                                  color: Colors.blue,
                                  icon: Icon(Icons.line_weight),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      setState(() {
                        tasksList.removeAt(index);

                       // tasksList[index].order--;
                         for (int i = index; i < tasksList.length; i++){
                           tasksList[i].order--;
                         }
                      });

                      // Then show a snackbar.
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('$index dismissed')));
                    }
                  },
                  background: Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${word(context).done.toUpperCase()} !!!",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      color: Colors.green),
                )
            ]);
      }

      if (state is UserLoadingState) {
        userBloc.add(UserLoadEvent());

        return Center(
          child: CircularProgressIndicator(),
        );
      }

      return Center();
    });
  }
}
