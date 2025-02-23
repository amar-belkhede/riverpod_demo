import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/screen/counter_screen.dart';
import 'package:riverpod_demo/screen/user_list_screen.dart';
import 'package:riverpod_demo/screen/user_screen.dart';

class AllScreen extends ConsumerWidget {
  const AllScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod Demo"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserListScreen()));
            },
            child: const Text("User List Screen"),
          ),
          // add space between buttons
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserScreen()));
            },
            child: const Text("User Screen"),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CounterScreen()));
            },
            child: const Text("Counter Screen"),
          ),
        ],
      ),
    );
  }
}
