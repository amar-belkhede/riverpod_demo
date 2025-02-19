import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/providers/counter_async_notifier_provider.dart';
import 'package:riverpod_demo/providers/counter_notifier_provider.dart';
// import 'package:riverpod_demo/providers/counter_state_provider.dart';

class CounterScreen extends ConsumerStatefulWidget {
  const CounterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final counter = ref.watch(counterStateProvider);
    // final counter = ref.watch(CounterNotifierProvider);
    final counterAsync = ref.watch(counterAsyncNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Column(
        children: [
          counterAsync.when(
            data: (counter) => Text(
              "You have pushed the button this many times: $counter",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            error: (error, stackTrace) => Text("$error"),
            loading: () => const CircularProgressIndicator(),
          ),
          // Text("You have pushed the button this many times"),
          // Text(
          //   "$counter",
          //   style: Theme.of(context).textTheme.bodyMedium,
          // ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              // ref.read(counterStateProvider.notifier).state++;
              // ref.read(CounterNotifierProvider.notifier).increment();
              ref.read(counterAsyncNotifierProvider.notifier).increment();
            },
            tooltip: "Increment",
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              // ref.read(counterStateProvider.notifier).state-- ;
              // ref.read(CounterNotifierProvider.notifier).decrement();
              ref.read(counterAsyncNotifierProvider.notifier).decrement();
            },
            tooltip: "Decrement",
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              // ref.read(counterStateProvider.notifier).state-- ;
              // ref.read(CounterNotifierProvider.notifier).reset();
              ref.read(counterAsyncNotifierProvider.notifier).reset();
            },
            tooltip: "Restore",
            child: const Icon(Icons.restore),
          ),
        ],
      ),
    );
  }
}
