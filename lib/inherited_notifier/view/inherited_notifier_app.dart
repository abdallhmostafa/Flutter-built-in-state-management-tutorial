import 'package:built_in_state_management/inherited_notifier/view/inherited_notifier_page.dart';
import 'package:built_in_state_management/inherited_notifier/viewmodel/inherited_notifier_theme_viewmodel.dart';
import 'package:flutter/material.dart';

class InheritedNotifierApp extends StatelessWidget {
  const InheritedNotifierApp({super.key});

  /// InheritedNotifier doesn't give you fine-grained
  /// "rebuild only this exact widget
  /// Common mistake to try and trigger yourself: nobody calls counterModel.dispose()
  ///  anywhere. InheritedNotifier
  @override
  Widget build(BuildContext context) {
    return AppInheritedNotifier(
      inheritedNotifierThemeViewmodel: InheritedNotifierThemeViewmodel(),

      child: Builder(
        builder: (context) {
          return MaterialApp(
            themeMode: AppInheritedNotifier.of(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,

            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: InheritedNotifierPage(),
          );
        },
      ),
    );
  }
}
