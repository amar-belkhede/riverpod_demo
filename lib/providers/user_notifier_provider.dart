import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userNotifierProvider =
    AutoDisposeNotifierProvider<UserNotifier, String>(UserNotifier.new);

class UserNotifier extends AutoDisposeNotifier<String> {
  @override
  String build() {
    final keepAlive = ref.keepAlive();
    Timer? timer;

    ref.onDispose(() {
      debugPrint("UserNotifier disposed");
      timer?.cancel();
    });

    ref.onCancel(() {
      timer = Timer(const Duration(seconds: 5), () {
        debugPrint("UserNotifier canceled");
        keepAlive.close();
      });
    });

    ref.onResume(() {
      debugPrint("UserNotifier resumed");
      timer?.cancel();
    });

    return "-";
  }

  void update(String value) {
    state = value;
  }
}
