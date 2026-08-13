import 'dart:math' show Random;

import 'package:built_in_state_management/value_notifier/viewmodel/value_notifier_viewmodel.dart';
import 'package:flutter/material.dart';

class ValueNotifierPage extends StatelessWidget {
  const ValueNotifierPage({super.key, required this.viewmodel});
  final ValueNotifierViewmodel viewmodel;
  @override
  Widget build(BuildContext context) {
    // List of colors to cycle through
    final List<Color> colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.yellow,
      Colors.purple,
      Colors.deepPurpleAccent,
      Colors.orange,
      Colors.pink,
    ];
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: viewmodel.colorNotifier.value,
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Value Notifier", style: const TextStyle(fontSize: 30)),
            Text(
              viewmodel.counterNotifier.value.toString(),
              style: const TextStyle(fontSize: 30),
            ),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    viewmodel.counterNotifier.value++;
                  },
                  icon: const Icon(Icons.add),
                ),

                IconButton(
                  onPressed: () {
                    viewmodel.counterNotifier.value--;
                  },
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),

            ElevatedButton(
              onPressed: () {
                // Select random color from list
                viewmodel.colorNotifier.value =
                    colors[Random().nextInt(colors.length)];
              },
              child: const Text("Change the Color"),
            ),
            ElevatedButton(
              onPressed: () {
                viewmodel.colorNotifier.value != viewmodel.colorNotifier.value;
              },
              child: const Text("Change the Theme"),
            ),
          ],
        ),
      ),
    );
  }
}
