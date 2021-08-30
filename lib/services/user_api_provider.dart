import 'dart:convert';

import 'package:synccards/model/bloc/task.dart';

import 'package:http/http.dart' as http;

class UserProvider {
  Future <List<Task>> getUser() async {
    final response = await http.get(
        Uri.parse("https://api.github.com/orgs/neo3216541/projects"),
        headers:<String, String>{'Accept': 'application/vnd.github.inertia-preview+json'
        ,"Authorization": "token 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"}
    );
    print(response);
    if (response.statusCode==200) {
      print("response == 200");
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => Task.fromJson(json)).toList();
    }else{
      print("response == exception");
      throw Exception("exception");
    }
// return [User(id: 3,email: "334",name: "fdf", phone: "434")];
  }
  Future <List<Task>> getMockUsers()async{

    return new List<Task>.generate(20, (i) => Task(id: i,description: "description description description description $i",name: "task name $i", additionalDescription: "additionalDescription additionalDescription additionalDescription $i"));


  }



  Future<http.Response> addIssue() {
    return http.post(
              // https://api.github.com/repos/octocat/hello-world/issues
     //   Uri.parse("https://api.github.com/repos/neo321654/synccards/issues"));

    Uri.parse('https://api.github.com/repos/neo321654/synccards/issues'),
      headers: <String, String>{
        'Accept': 'application/vnd.github.v3+json',
        'repo': 'sync',
        'progects': 'sync',
        'path': '/neo321654/synccards/issues',

        "Authorization": "token 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"

      },
      body: jsonEncode(<String, String>{
       'title': 'last Title11',

      }),
    );
  }

}

//
