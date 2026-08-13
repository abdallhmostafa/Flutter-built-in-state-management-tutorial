import 'dart:math' show Random;

import 'package:built_in_state_management/value_with_inherited_notifier/viewmodel/value_with_inherited_notifier_viewmodel.dart';
import 'package:flutter/material.dart';


class ValueWithInheritedNotifierPage extends StatelessWidget {
  const ValueWithInheritedNotifierPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of colors to cycle through
    final themeNotifier = ValueWithInheritedNotifierViewmodel.of(context).themeNotifier;
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
    return ValueListenableBuilder(
      valueListenable: ValueWithInheritedNotifierViewmodel.of(context).colorNotifier,
      builder: (context, _, _) {
        return Scaffold(
          appBar: AppBar(),
          backgroundColor: ValueWithInheritedNotifierViewmodel.of(
            context,
          ).colorNotifier.value,
          body: Center(
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Value and Inherited Notifier",
                  style: const TextStyle(fontSize: 30),
                ),
                ValueListenableBuilder(
                  builder: (context, value, child) => Text(
                    ValueWithInheritedNotifierViewmodel.of(
                      context,
                    ).counterNotifier.value.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                  valueListenable: ValueWithInheritedNotifierViewmodel.of(
                    context,
                  ).counterNotifier,
                ),
                Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        ValueWithInheritedNotifierViewmodel.of(
                          context,
                        ).counterNotifier.value++;
                      },
                      icon: const Icon(Icons.add),
                    ),

                    IconButton(
                      onPressed: () {
                        ValueWithInheritedNotifierViewmodel.of(
                          context,
                        ).counterNotifier.value--;
                      },
                      icon: const Icon(Icons.remove),
                    ),
                  ],
                ),

                ElevatedButton(
                  onPressed: () {
                    // Select random color from list
                    ValueWithInheritedNotifierViewmodel.of(context).colorNotifier.value =
                        colors[Random().nextInt(colors.length)];
                  },
                  child: const Text("Change the Color"),
                ),
                ElevatedButton(
                  onPressed: () {
                    themeNotifier.value = !themeNotifier.value;
                  },
                  child: const Text("Change the Theme"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
