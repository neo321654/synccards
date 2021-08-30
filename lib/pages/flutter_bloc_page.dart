import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synccards/bloc/color_bloc.dart';
import 'package:synccards/model/bloc/user_bloc.dart';
import 'package:synccards/services/user_repository.dart';
import 'package:synccards/widget/blocExample/action_buttons.dart';
import 'package:synccards/widget/blocExample/user_list.dart';

class FlutterBlocPage extends StatelessWidget {
  const FlutterBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);

    UsersRepository usersRepository = UsersRepository();

    return BlocProvider<UserBloc>(
      create: (context){
      return UserBloc(usersRepository: usersRepository);
    },
    child: Scaffold(
      appBar: AppBar(
        title: Text("flutter bloc"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (BuildContext context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ActionButtons(),
                Expanded(
                  child: UserList(),
                ),
                Expanded(
                  child: AnimatedContainer(
                    height: 10,
                    width: 10,
                    color: state,
                    duration: Duration(milliseconds: 500),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              _bloc.add(ColorEvent.event_red);
            },
            backgroundColor: Colors.red,
          ),
          FloatingActionButton(
            onPressed: () {
              _bloc.add(ColorEvent.event_green);
            },
            backgroundColor: Colors.green,
          ),
        ],
      ),
    ),
    );


  }
}
