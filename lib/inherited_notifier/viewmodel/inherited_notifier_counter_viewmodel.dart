import 'package:flutter/material.dart';

class InheritedNotifierCounterViewmodel extends ChangeNotifier {
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

class CounterInheritedNotifier
    extends InheritedNotifier<InheritedNotifierCounterViewmodel> {
  const CounterInheritedNotifier({
    super.key,
    required super.child,
    required this.inheritedNotifierCounterViewmodel,
  }) : super(notifier: inheritedNotifierCounterViewmodel);
  final InheritedNotifierCounterViewmodel inheritedNotifierCounterViewmodel;

  static InheritedNotifierCounterViewmodel of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CounterInheritedNotifier>()!
        .inheritedNotifierCounterViewmodel;
  }
}
