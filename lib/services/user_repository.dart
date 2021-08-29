import 'package:synccards/model/bloc/task.dart';
import 'package:synccards/services/user_api_provider.dart';

class UsersRepository{
  UserProvider _usersProvider = UserProvider();
 Future<List<Task>> getAllUsers()=> _usersProvider.getUser();
 Future<List<Task>> getMockUsers()=> _usersProvider.getMockUsers();
 Future addIssue()=> _usersProvider.addIssue();

}