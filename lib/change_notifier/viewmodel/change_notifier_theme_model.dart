import 'package:flutter/material.dart';

class ChangeNotifierThemeModel extends ChangeNotifier {
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