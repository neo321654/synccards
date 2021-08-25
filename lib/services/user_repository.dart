import 'package:synccards/model/bloc/user.dart';
import 'package:synccards/services/user_api_provider.dart';

class UsersRepository{
  UserProvider _usersProvider = UserProvider();
 Future<List<User>> getAllUsers()=> _usersProvider.getUser();
 Future addIssue()=> _usersProvider.addIssue();

}