import 'package:flutter/material.dart';

class InheritedWidgetModel {
  final int count;
  final Color color;

  const InheritedWidgetModel({required this.count, required this.color});

  InheritedWidgetModel copyWith({int? count, Color? color}) {
    return InheritedWidgetModel(
      count: count ?? this.count,
      color: color ?? this.color,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is InheritedWidgetModel &&
        other.count == count &&
        other.color == color;
  }

  @override
  int get hashCode => Object.hash(count, color);
}
