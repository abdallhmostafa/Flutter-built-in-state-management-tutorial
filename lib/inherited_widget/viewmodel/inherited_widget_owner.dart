import 'package:built_in_state_management/inherited_widget/model/inherited_widget_model.dart';
import 'package:built_in_state_management/inherited_widget/viewmodel/inherited_widget_state.dart';
import 'package:flutter/material.dart';

class InheritedWidgetOwner extends StatefulWidget {
  const InheritedWidgetOwner({super.key, required this.child});
  final Widget child;

  @override
  State<InheritedWidgetOwner> createState() => _InheritedWidgetOwnerState();
}

class _InheritedWidgetOwnerState extends State<InheritedWidgetOwner> {
  InheritedWidgetModel state = InheritedWidgetModel(
    count: 10,
    color: Colors.blueAccent,
  );
  void increment() {
    setState(() {
      state = state.copyWith(count: (state.count) + 1);
    });
  }

  void decrement() {
    setState(() {
      state = state.copyWith(count: (state.count) - 1);
    });
  }

  void changeColor({required Color newColor}) {
    setState(() {
      state = state.copyWith(color: newColor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedWidgetState(
      state: state,
      changeColor: changeColor,
      decrement: decrement,
      increment: increment,
      child: widget.child,
    );
  }
}
