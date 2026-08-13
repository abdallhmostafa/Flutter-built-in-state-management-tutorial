import 'dart:developer' as developer;
import 'dart:math';

import 'package:built_in_state_management/inherited_widget/viewmodel/inherited_widget_state.dart';
import 'package:flutter/material.dart';

class InheritedWidgetPage extends StatelessWidget {
  const InheritedWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterState = InheritedWidgetState.of(context);
    developer.log("Counter Screen Build method Called");

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
      backgroundColor: counterState.state.color,
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counterState.state.count.toString(),
              style: const TextStyle(fontSize: 30),
            ),

            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    counterState.increment?.call();
                  },
                  icon: const Icon(Icons.add),
                ),

                IconButton(
                  onPressed: counterState.decrement?.call,
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),

            ElevatedButton(
              onPressed: () {
                // Select random color from list
                final randomColor = colors[Random().nextInt(colors.length)];
                counterState.changeColor?.call(newColor: randomColor);
              },
              child: const Text("Change the Color"),
            ),
          ],
        ),
      ),
    );
  }
}
