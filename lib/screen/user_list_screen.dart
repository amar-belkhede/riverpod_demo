import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/screen/add_user_screen.dart';
import 'package:riverpod_demo/view_model/user_view_model.dart';

class UserListScreen extends ConsumerStatefulWidget {
  const UserListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserListScreenState();
}

class _UserListScreenState extends ConsumerState<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    final userViewModel = ref.watch(UserViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: ListView.builder(
                itemCount: userViewModel.users.length,
                itemBuilder: (context, index) {
                  final data = userViewModel.users[index];
                  return ListTile(
                    title: Text(data.username),
                    subtitle: Text(data.email),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddUserScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
