import 'package:built_in_state_management/inherited_widget/view/inherited_widget_page.dart';
import 'package:built_in_state_management/inherited_widget/viewmodel/inherited_widget_owner.dart';
import 'package:flutter/material.dart';

class InheritedWidgetApp extends StatelessWidget {
  const InheritedWidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InheritedWidgetOwner(child: InheritedWidgetPage()),
    );
  }
}
