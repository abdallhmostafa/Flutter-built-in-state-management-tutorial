import 'package:built_in_state_management/inherited_widget/model/inherited_widget_model.dart';
import 'package:flutter/material.dart';

class InheritedWidgetState extends InheritedWidget {
  const InheritedWidgetState({
    super.key,
    required super.child,
    required this.state,
    this.changeColor,
    this.decrement,
    this.increment,
  });
  final InheritedWidgetModel state;
  final void Function({required Color newColor})? changeColor;
  final VoidCallback? decrement;
  final VoidCallback? increment;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    final old = oldWidget as InheritedWidgetState;
    return old.state != state;
  }

  static InheritedWidgetState of(BuildContext context) {
    final inherited = context
        .dependOnInheritedWidgetOfExactType<InheritedWidgetState>();
    if (inherited != null) return inherited;
    throw FlutterError(
      'InheritedWidgetState not found in context. '
      'Make sure CounterStateOwner is an ancestor of the widget calling InheritedWidgetState.of(context).',
    );
  }
}