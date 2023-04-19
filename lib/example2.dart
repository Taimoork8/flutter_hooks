import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExampleTwo extends HookWidget {
  const ExampleTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final text = useState('');
    useEffect(() {
      controller.addListener(() {
        text.value = controller.text;
      });
      return null;
    }, [controller]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Example 2"),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),
          Text('You typed : ${text.value}'),
        ],
      ),
    );
  }
}
