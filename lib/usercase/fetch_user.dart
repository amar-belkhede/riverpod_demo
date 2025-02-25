import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_demo/model/user.dart';
import 'package:riverpod_demo/repository/user_repository.dart';

// final fetchUserProvider = Provider<FetchUser>((ref) {
//   final userRepository = ref.watch(userRepositoryProvider);
//   return FetchUser(userRepository);
// });

part 'fetch_user.g.dart';

@riverpod
FetchUser fetchUser(Ref ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return FetchUser(userRepository);
}

class FetchUser {
  final UserRepository userRepository;
  FetchUser(this.userRepository);

  Future<List<User>> call() async {
    await Future.delayed(const Duration(seconds: 2));
    return await userRepository.fetchusers();
  }

  Future<List<User>> fetchUser() async {
    await Future.delayed(const Duration(seconds: 2));
    return await userRepository.fetchusers();
  }
}
