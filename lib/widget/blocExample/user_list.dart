import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        return Container(

          child: ListTile(
            leading: Text(
              "id: 1", style: Theme.of(context).textTheme.bodyText1,
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("My name"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "email: email@ru",
                      style: TextStyle(fontStyle: FontStyle.italic)),
                    Text(
                      "number: 34530-09",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
