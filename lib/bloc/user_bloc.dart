// user_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/api_service.dart';
import '../models/user.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiService apiService;

  UserBloc({required this.apiService}) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchUser) {
      yield UserLoading();
      try {
        Map<String, dynamic> userData = await apiService.fetchUserProfile();
        User user = User.fromJson(userData); // Ensure User.fromJson is correctly implemented
        yield UserLoaded(user: user);
      } catch (error) {
        yield UserError(message: error.toString());
      }
    }
  }
}
