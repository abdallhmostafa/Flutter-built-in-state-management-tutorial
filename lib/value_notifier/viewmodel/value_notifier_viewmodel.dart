import 'package:flutter/material.dart';

class ValueNotifierViewmodel {
  final ValueNotifier<int> counterNotifier;
  final ValueNotifier<Color> colorNotifier;
  final ValueNotifier<bool> themeNotifier;

  ValueNotifierViewmodel({
    required this.counterNotifier,
    required this.colorNotifier,
    required this.themeNotifier,
  });
}
