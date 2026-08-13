import 'dart:developer';

import 'package:built_in_state_management/change_notifier/viewmodel/change_notifier_counter_and_color_model.dart';
import 'package:built_in_state_management/change_notifier/viewmodel/change_notifier_theme_model.dart';
import 'package:flutter/material.dart';

class ChangeNotifierPage extends StatelessWidget {
  const ChangeNotifierPage({
    super.key,
    required this.counterAndColorModel,
    required this.themeModel,
  });
  final ChangeNotifierCounterAndColorModel counterAndColorModel;
  final ChangeNotifierThemeModel themeModel;

  @override
  Widget build(BuildContext context) {
    log("ChangeNotifier build called");
    // List of colors to cycle through
    // final List<Color> colors = [
    //   Colors.blue,
    //   Colors.red,
    //   Colors.green,
    //   Colors.yellow,
    //   Colors.purple,
    //   Colors.deepPurpleAccent,
    //   Colors.orange,
    //   Colors.pink,
    // ];

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: counterAndColorModel.color,
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Change Notifier", style: const TextStyle(fontSize: 30)),
            ListenableBuilder(
              listenable: counterAndColorModel,
              builder: (context, child) {
                return Text(
                  counterAndColorModel.counter.toString(),
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
                    counterAndColorModel.increment();
                  },
                  icon: const Icon(Icons.add),
                ),

                IconButton(
                  onPressed: counterAndColorModel.decrement,
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),

            ElevatedButton(
              onPressed: () {
                // // Select random color from list
                // final randomColor = colors[Random().nextInt(colors.length)];
                // counterAndColorModel.changeColor(newColor: randomColor);
              },
              child: const Text("Change the Color"),
            ),
            ElevatedButton(
              onPressed: () {
                themeModel.toggle();
              },
              child: const Text("Change the Theme"),
            ),
          ],
        ),
      ),
    );
  }
}
