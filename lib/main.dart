import 'package:built_in_state_management/inherited_notifier/view/inherited_notifier_app.dart';
import 'package:built_in_state_management/value_and_inherited_notifier.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(InheritedNotifierApp());
}



class MyAppValueAndInheritedNotifier extends StatefulWidget {
  const MyAppValueAndInheritedNotifier({super.key});

  @override
  State<MyAppValueAndInheritedNotifier> createState() =>
      _MyAppValueAndInheritedNotifierState();
}

class _MyAppValueAndInheritedNotifierState
    extends State<MyAppValueAndInheritedNotifier> {
  final colorNotifier = ValueNotifier(Colors.amberAccent);
  final counterNotifier = ValueNotifier(0);
  final themeNotifier = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return ValueAndInheritedNotifier(
      colorNotifier: colorNotifier,
      counterNotifier: counterNotifier,
      themeNotifier: themeNotifier,

      child: Builder(
        builder: (context) {
          return ValueListenableBuilder(
            valueListenable: ValueAndInheritedNotifier.of(
              context,
            ).themeNotifier,
            builder: (context, value, child) {
              return MaterialApp(
                themeMode: value ? ThemeMode.dark : ThemeMode.light,

                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                home: CounterScreenValueAndInheritedNotifier(),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    colorNotifier.dispose();
    counterNotifier.dispose();
    themeNotifier.dispose();
    super.dispose();
  }
}
