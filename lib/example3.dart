import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExampleThree extends HookWidget {
  const ExampleThree({super.key});

  @override
  Widget build(BuildContext context) {
    final future = useMemoized(
      () => NetworkAssetBundle(Uri.parse(url))
          .load(url)
          .then((data) => data.buffer.asUint8List())
          .then((data) => Image.memory(data)),
    );
    final snapshot = useFuture(future);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Ecample 3'),
        ),
        body: Column(
          children: [snapshot.data].compactMap().toList(),
        ));
  }
}

extension CompactMap<T> on Iterable<T?> {
  Iterable<T> compactMap<E>([
    E? Function(T?)? transform,
  ]) =>
      map(
        transform ?? (e) => e,
      ).where((e) => e != null).cast();
}

const url =
    'https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg';
