import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterAsyncNotifierProvider =
    AsyncNotifierProvider<CounterAsyncNotifier, int>(CounterAsyncNotifier.new);

class CounterAsyncNotifier extends AsyncNotifier<int> {
  @override
  FutureOr<int> build() async {
    final value = await Future.delayed(const Duration(seconds: 1), () => 0);
    return value;
  }

  Future<void> increment() async {
    state = const AsyncLoading();
    final value =
        await Future.delayed(const Duration(seconds: 1), () => state.value) ??
            0;

    state = AsyncValue.data(value + 1);
  }

  Future<void> decrement() async {
    state = const AsyncLoading();
    final value =
        await Future.delayed(const Duration(seconds: 1), () => state.value) ??
            0;

    state = AsyncValue.data(value - 1);
  }

  Future<void> reset() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        if (Random().nextInt(max(1, 10)) / 2 == 0) {
          return Future.error(Exception("Error in reseting the counter"));
        } else {
          return Future.delayed(const Duration(seconds: 1), () => 0);
        }
      },
    );
  }
}
