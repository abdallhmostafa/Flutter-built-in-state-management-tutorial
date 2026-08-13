import 'dart:math' show Random;

import 'package:flutter/material.dart';

class ValueAndInheritedNotifier extends InheritedNotifier {
  const ValueAndInheritedNotifier({
    super.key,
    required super.child,
    required this.counterNotifier,
    required this.themeNotifier,
    required this.colorNotifier,
  });

  final ValueNotifier<int> counterNotifier;
  final ValueNotifier<bool> themeNotifier;
  final ValueNotifier<Color> colorNotifier;

  static ValueAndInheritedNotifier of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ValueAndInheritedNotifier>()!;
  }
}

class CounterScreenValueAndInheritedNotifier extends StatelessWidget {
  const CounterScreenValueAndInheritedNotifier({super.key});

  @override
  Widget build(BuildContext context) {
    // List of colors to cycle through
    final themeNotifier = ValueAndInheritedNotifier.of(context).themeNotifier;
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
      valueListenable: ValueAndInheritedNotifier.of(context).colorNotifier,
      builder: (context, _, _) {
        return Scaffold(
          appBar: AppBar(),
          backgroundColor: ValueAndInheritedNotifier.of(
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
                    ValueAndInheritedNotifier.of(
                      context,
                    ).counterNotifier.value.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                  valueListenable: ValueAndInheritedNotifier.of(
                    context,
                  ).counterNotifier,
                ),
                Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        ValueAndInheritedNotifier.of(
                          context,
                        ).counterNotifier.value++;
                      },
                      icon: const Icon(Icons.add),
                    ),

                    IconButton(
                      onPressed: () {
                        ValueAndInheritedNotifier.of(
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
                    ValueAndInheritedNotifier.of(context).colorNotifier.value =
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
