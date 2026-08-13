import 'dart:math' show Random;

import 'package:flutter/material.dart';

class CounterScreenInheritedNotifier extends StatelessWidget {
  const CounterScreenInheritedNotifier({
    super.key,
    required this.counterNotifier,
    required this.colorNotifier,
    required this.themeNotifier,
  });
  final ValueNotifier<int> counterNotifier;
  final ValueNotifier<Color> colorNotifier;
  final ValueNotifier<bool> themeNotifier;

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
      backgroundColor: colorNotifier.value,
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Value Notifier", style: const TextStyle(fontSize: 30)),
            Text(
              counterNotifier.value.toString(),
              style: const TextStyle(fontSize: 30),
            ),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    counterNotifier.value++;
                  },
                  icon: const Icon(Icons.add),
                ),

                IconButton(
                  onPressed: () {
                    counterNotifier.value--;
                  },
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),

            ElevatedButton(
              onPressed: () {
                // Select random color from list
                colorNotifier.value = colors[Random().nextInt(colors.length)];
              },
              child: const Text("Change the Color"),
            ),
            ElevatedButton(
              onPressed: () {
                colorNotifier.value != colorNotifier.value;
              },
              child: const Text("Change the Theme"),
            ),
          ],
        ),
      ),
    );
  }
}
