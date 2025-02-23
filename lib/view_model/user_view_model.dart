import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/model/user.dart';
import 'package:riverpod_demo/state/user_state.dart';

final UserViewModelProvider = NotifierProvider<UserViewModel, UserState>(UserViewModel.new);


class UserViewModel extends Notifier<UserState> {
  @override
  UserState build() {
    return const UserState(isLoading: true);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setError(String error) {
    state = state.copyWith(error: error);
  }

  void setUsers(List<User> users) {
    state = state.copyWith(users: users);
  }
}
