import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExampleFour extends HookWidget {
  const ExampleFour({super.key});

  @override
  Widget build(BuildContext context) {
    final countDown = useMemoized(() => CountDown(from: 20));
    final notifier = useListenable(countDown);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Example 4'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text(notifier.value.toString())),
        ],
      ),
    );
  }
}

class CountDown extends ValueNotifier<int> {
  late StreamSubscription sub;

  CountDown({required int from}) : super(from) {
    sub = Stream.periodic(
      const Duration(seconds: 1),
      (v) => from - v,
    ).takeWhile((value) => value >= 0).listen((value) {
      this.value = value;
    });
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }
}
