import 'dart:convert';

import 'package:synccards/model/bloc/user.dart';

import 'package:http/http.dart' as http;

class UserProvider {
  Future <List<User>> getUser() async {
    final response = await http.get(
        Uri.parse("https://api.github.com/repos/neo321654/synccards/issues"),
        headers:<String, String>{'Accept': 'application/vnd.github.v3+json','Authorization': 'token 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'}
    );
    print(response);
    if (response.statusCode==200) {
      print("response == 200");
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    }else{
      print("response == exception");
      throw Exception("exception");
    }
// return [User(id: 3,email: "334",name: "fdf", phone: "434")];
  }

  // await octokit.request('POST /repos/{owner}/{repo}/issues', {
  // owner: 'octocat',
  // repo: 'hello-world',
  // title: 'title'
  // })

  // Future  addIssue() async {
  //   var url = Uri.parse('https://api.github.com/repos/neo321654/synccards/issues');
  //   var title1 = {'title': 'titl111112e'};
  //   var response = await http.post(url, body: title1);
  // }

  Future<http.Response> addIssue() {
    return http.post(
              // https://api.github.com/repos/octocat/hello-world/issues
     //   Uri.parse("https://api.github.com/repos/neo321654/synccards/issues"));

    Uri.parse('https://api.github.com/repos/neo321654/synccards/issues'),
      headers: <String, String>{
        'Accept': 'application/vnd.github.v3+json',
        "Authorization": "token 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"

      },
      body: jsonEncode(<String, String>{
       'title': 'titlenewisu2e',

      }),
    );
  }

}

//
