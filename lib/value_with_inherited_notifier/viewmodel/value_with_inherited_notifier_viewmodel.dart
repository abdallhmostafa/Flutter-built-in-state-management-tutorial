import 'package:flutter/material.dart';

class ValueWithInheritedNotifierViewmodel extends InheritedNotifier {
  const ValueWithInheritedNotifierViewmodel({
    super.key,
    required super.child,
    required this.counterNotifier,
    required this.themeNotifier,
    required this.colorNotifier,
  });

  final ValueNotifier<int> counterNotifier;
  final ValueNotifier<bool> themeNotifier;
  final ValueNotifier<Color> colorNotifier;

  static ValueWithInheritedNotifierViewmodel of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ValueWithInheritedNotifierViewmodel>()!;
  }
}
