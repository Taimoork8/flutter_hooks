//
//in this example we will use the useAppLifecycleState
//this means that the app will hide the sensitive data,
// when the app goes to the background loike the bank app when we
// goto the other app and the bank app is still running in the background,
// and we comeback to it its want login detail.
//so to hide the data we will use the useapplidecyclestate.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExampleEight extends HookWidget {
  const ExampleEight({super.key});

  @override
  Widget build(BuildContext context) {
    final state = useAppLifecycleState();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Example 8'),
      ),
      body: Opacity(
        opacity: state == AppLifecycleState.resumed ? 1.0 : 0.0,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black.withAlpha(100),
              spreadRadius: 10,
            ),
          ]),
          child: Image.asset('assets/card.png'),
        ),
      ),
    );
  }
}

const url =
    'https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg';
