import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/providers/user_notifier_provider.dart';
import 'package:riverpod_demo/view_model/user_view_model.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  final TextEditingController _userController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    debugPrint("userScreen dispose");
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userNotifierProvider);
    final UserViewModel = ref.watch(UserViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("User Screen"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: TextFormField(
                        controller: _userController,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Username",
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        ref
                            .read(userNotifierProvider.notifier)
                            .update(_userController.text);
                        _userController.clear();
                      },
                      child: const Text("add user"),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  "User: $user",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
