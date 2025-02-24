import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/model/user.dart';
import 'package:riverpod_demo/state/user_state.dart';

final UserViewModelProvider =
    NotifierProvider<UserViewModel, UserState>(UserViewModel.new);

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

  void adduser(User user) {
    state = state.copyWith(
      isLoading: true,
      isAdded: false,
      error: null,
    );

    final currentUsers = state.users;

    state = state.copyWith(
      isLoading: false,
      isAdded: true,
      error: null,
      users: [...currentUsers, user],
    );
  }
}
