import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synccards/model/bloc/user_bloc.dart';
import 'package:synccards/model/bloc/user_state.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc,UserState>(builder: (context,state){
      if(state is UserEmptyState){
        return Center(child: Text("no data received, press button load",style: TextStyle(color: Colors.red),),);
      }
      if(state is UserLoadingState ){
        return Center(child: CircularProgressIndicator(),);
      }
      if(state is UserLoadedState){
        print("UserLoadedState");
        return   ListView.builder(
          itemCount: state.loadedUser.length,
          itemBuilder: (context, index) {
            return Container(
              color: index % 2 == 0 ? Colors.yellow : Colors.green,

              child: ListTile(
                leading: Text(
                  "${state.loadedUser[index].id}", style: Theme.of(context).textTheme.bodyText1,
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${state.loadedUser[index].name}"),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                            "${state.loadedUser[index].description}",
                            style: TextStyle(fontStyle: FontStyle.italic)),
                        Text(
                          "${state.loadedUser[index].additionalDescription}",
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
      if(state is UserErrorState){
        print("error");
        Center(child: Text("Error",style: TextStyle(color: Colors.red),),);
      }
      return Center();
    });


  }
}
