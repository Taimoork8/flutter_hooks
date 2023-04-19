import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExampleFive extends HookWidget {
  const ExampleFive({super.key});

  @override
  Widget build(BuildContext context) {
    final opacity = useAnimationController(
      duration: const Duration(seconds: 1),
      initialValue: 1.0,
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    final size = useAnimationController(
      duration: const Duration(seconds: 1),
      initialValue: 1.0,
      lowerBound: 0.0,
      upperBound: 1.0,
    );

    final controller = useScrollController();

    useEffect(() {
      controller.addListener(() {
        final newOpacity = max(imageHeight - controller.offset, 0.0);
        final normalized = newOpacity.normalized(0.0, imageHeight).toDouble();
        opacity.value = normalized;
        size.value = normalized;
      });
      return null;
    }, [controller]);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Example 5'),
      ),
      body: Column(children: [
        SizeTransition(
          sizeFactor: size,
          axis: Axis.vertical,
          axisAlignment: -1.0,
          child: FadeTransition(
            opacity: opacity,
            child: Image.network(
              url,
              height: imageHeight,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: controller,
            itemCount: 50,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('person ${index + 1}'),
              );
            },
          ),
        )
      ]),
    );
  }
}

const url =
    'https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg';

const imageHeight = 300.0;

extension Normalize on num {
  num normalized(
    num selfRangeMin,
    num selfRangeMax, [
    num normalizedRangeMin = 0.0,
    num normalizedRangeMax = 1.0,
  ]) =>
      (normalizedRangeMax - normalizedRangeMin) *
          ((this - selfRangeMin) / (selfRangeMax - selfRangeMin)) +
      normalizedRangeMin;
}
