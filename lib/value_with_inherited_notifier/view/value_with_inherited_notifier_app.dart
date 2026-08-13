import 'package:built_in_state_management/value_with_inherited_notifier/view/value_with_inherited_notifier_page.dart';
import 'package:built_in_state_management/value_with_inherited_notifier/viewmodel/value_with_inherited_notifier_viewmodel.dart';
import 'package:flutter/material.dart';

class ValueWithInheritedNotifierApp extends StatefulWidget {
  const ValueWithInheritedNotifierApp({super.key});

  @override
  State<ValueWithInheritedNotifierApp> createState() =>
      _ValueWithInheritedNotifierAppState();
}

class _ValueWithInheritedNotifierAppState
    extends State<ValueWithInheritedNotifierApp> {
  final colorNotifier = ValueNotifier(Colors.amberAccent);
  final counterNotifier = ValueNotifier(0);
  final themeNotifier = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return ValueWithInheritedNotifierViewmodel(
      colorNotifier: colorNotifier,
      counterNotifier: counterNotifier,
      themeNotifier: themeNotifier,

      child: Builder(
        builder: (context) {
          return ValueListenableBuilder(
            valueListenable: ValueWithInheritedNotifierViewmodel.of(
              context,
            ).themeNotifier,
            builder: (context, value, child) {
              return MaterialApp(
                themeMode: value ? ThemeMode.dark : ThemeMode.light,

                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                home: ValueWithInheritedNotifierPage(),
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
