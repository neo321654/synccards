import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synccards/model/bloc/task.dart';
import 'package:synccards/model/bloc/user_event.dart';
import 'package:synccards/model/bloc/user_state.dart';
import 'package:synccards/services/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;



  UserBloc({required this.usersRepository}) : super(UserLoadingState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoadEvent) {
      yield UserLoadingState();
      try {
        final List<Task> _loadedUserList = await usersRepository.getMockUsers();

        yield UserLoadedState(loadedUser: _loadedUserList);
      } catch (E) {
        print(E.toString());
        yield UserErrorState();
      }
    }else if (event is UserClearEvent){
      yield UserEmptyState();
    }else if(event is UserAddIssue){
      usersRepository.addIssue();
    }
  }
}
