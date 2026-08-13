import 'dart:developer';
import 'dart:math' show Random;

import 'package:built_in_state_management/inherited_notifier/viewmodel/inherited_notifier_counter_viewmodel.dart';
import 'package:built_in_state_management/inherited_notifier/viewmodel/inherited_notifier_theme_viewmodel.dart';
import 'package:flutter/material.dart';

class InheritedNotifierPage extends StatelessWidget {
  const InheritedNotifierPage({super.key});

  @override
  Widget build(BuildContext context) {
    log(" build called", name: "Inherited Notifier");
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
    return CounterInheritedNotifier(
      inheritedNotifierCounterViewmodel: InheritedNotifierCounterViewmodel(),
      child: Builder(
        builder: (context) {
          log(" builder", name: "Inherited Notifier");

          return Scaffold(
            appBar: AppBar(),
            backgroundColor: CounterInheritedNotifier.of(context).color,
            body: Center(
              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Inherited Notifier",
                    style: const TextStyle(fontSize: 30),
                  ),
                  ListenableBuilder(
                    listenable: InheritedNotifierCounterViewmodel(),
                    builder: (context, child) {
                      return Text(
                        CounterInheritedNotifier.of(context).counter.toString(),
                        style: const TextStyle(fontSize: 30),
                      );
                    },
                  ),
                  Row(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          CounterInheritedNotifier.of(context).increment();
                        },
                        icon: const Icon(Icons.add),
                      ),

                      IconButton(
                        onPressed: CounterInheritedNotifier.of(
                          context,
                        ).decrement,
                        icon: const Icon(Icons.remove),
                      ),
                    ],
                  ),

                  ElevatedButton(
                    onPressed: () {
                      // Select random color from list
                      final randomColor =
                          colors[Random().nextInt(colors.length)];
                      CounterInheritedNotifier.of(
                        context,
                      ).changeColor(newColor: randomColor);
                    },
                    child: const Text("Change the Color"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      AppInheritedNotifier.of(context).toggle();
                    },
                    child: const Text("Change the Theme"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

