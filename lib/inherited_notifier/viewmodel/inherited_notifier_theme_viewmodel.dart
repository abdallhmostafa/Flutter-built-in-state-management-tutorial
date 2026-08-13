
import 'package:flutter/material.dart';

class InheritedNotifierThemeViewmodel extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;
  void toggle() {
    if (_isDark) {
      _isDark = false;
    } else {
      _isDark = true;
    }
    notifyListeners();
  }
}

class AppInheritedNotifier extends InheritedNotifier {
  const AppInheritedNotifier({
    super.key,
    required super.child,
    required this.inheritedNotifierThemeViewmodel,
  }) : super(notifier: inheritedNotifierThemeViewmodel);
  final InheritedNotifierThemeViewmodel inheritedNotifierThemeViewmodel;

  static InheritedNotifierThemeViewmodel of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AppInheritedNotifier>()!
        .inheritedNotifierThemeViewmodel;
  }
}

