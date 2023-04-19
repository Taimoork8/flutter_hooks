//in this example we will useStreamController

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExampleSix extends HookWidget {
  const ExampleSix({super.key});

  @override
  Widget build(BuildContext context) {
    late final StreamController<double> controller;
    controller = useStreamController<double>(onListen: () {
      controller.sink.add(0.0);
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Example 6'),
      ),
      body: StreamBuilder<double>(
        stream: controller.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final rotation = snapshot.data ?? 0.0;
            return GestureDetector(
              onTap: () {
                controller.sink.add(rotation + 10.0);
              },
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(rotation / 360.0),
                child: Center(
                  child: Image.network(url),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

const url =
    'https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg';
