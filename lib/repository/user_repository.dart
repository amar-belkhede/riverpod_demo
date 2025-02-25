import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/model/user.dart';

final userRepositoryProvider = Provider<UserRepository>(
  (ref) {
    return UserRepository();
  },
);

class UserRepository {
  Future<List<User>> fetchusers() async {
    return [
      User(id: 1, username: 'user1', age: 20, email: 'email1@gmail.com'),
      User(id: 2, username: 'user2', age: 21, email: 'sdadas'),
    ];
  }
}
