
import 'package:flutter/material.dart';

class ChangeNotifierCounterAndColorModel extends ChangeNotifier {
  int _counter = 0;
  Color _color = Colors.blueAccent;
  int get counter => _counter;
  Color get color => _color;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  void changeColor({required Color newColor}) {
    _color = newColor;
    notifyListeners();
  }
}
