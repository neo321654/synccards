import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synccards/model/bloc/user_bloc.dart';
import 'package:synccards/model/bloc/user_event.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MaterialButton(
          onPressed: () {
              userBloc.add(UserLoadEvent());
          },
          child: Text("load"),
          color: Colors.green,
        ),
        SizedBox(
          width: 8,
        ),
        MaterialButton(
          onPressed: () {
            userBloc.add(UserClearEvent());
          },
          child: Text("Clear"),
          color: Colors.red,
        ),
        SizedBox(
          width: 8,
        ),
        MaterialButton(
          onPressed: () {
            userBloc.add(UserAddIssue());
          },
          child: Text("Add"),
          color: Colors.blue,
        ),
      ],
    );
  }
}
