import 'dart:convert';

import 'package:synccards/model/bloc/user.dart';

import 'package:http/http.dart' as http;

class UserProvider {
  Future <List<User>> getUser() async {
    final response = await http.get(
        // Uri.parse("https://jsonplaceholder.typicode.com/users"));
        Uri.parse("https://api.github.com/repos/neo321654/synccards/issues"));

    if (response.statusCode==200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    }else{
      throw Exception("exception");
    }
// return [User(id: 3,email: "334",name: "fdf", phone: "434")];
  }
}

//
