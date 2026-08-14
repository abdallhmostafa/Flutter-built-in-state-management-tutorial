import 'package:built_in_state_management/change_notifier/view/change_notifier_cart_item_page.dart';
import 'package:built_in_state_management/change_notifier/viewmodel/change_notifier_counter_and_color_model.dart';
import 'package:built_in_state_management/change_notifier/viewmodel/change_notifier_theme_model.dart';
import 'package:built_in_state_management/change_notifier/view/change_notifier_page.dart';
import 'package:flutter/material.dart';

class ChangeNotifierApp extends StatefulWidget {
  const ChangeNotifierApp({super.key});

  @override
  State<ChangeNotifierApp> createState() => _ChangeNotifierAppState();
}

class _ChangeNotifierAppState extends State<ChangeNotifierApp> {
  final counterModel = ChangeNotifierCounterAndColorModel();

  final themeModel = ChangeNotifierThemeModel();

  @override
  void dispose() {
    counterModel.dispose();

    themeModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Common mistake nobody calls counterModel.dispose() anywhere.
    /// InheritedNotifier reaches into the notifier to listen to it,
    /// but it doesn't own its lifecycle — creating it doesn't mean it gets cleaned up.

    /// The prolem of the Change Notifier Pass as Argument
    /// But it good in Testing because it zero dependency in Flutter Code it's
    /// pure Dart code
    /// Prop-drilling problem InheritedWidget
    ///
    /// ChangeNotifier fixed "who owns the data and how do we announce changes"
    /// it didn't fix "how does a deeply nested widget reach the data without
    /// being handed it explicitly."

    return ListenableBuilder(
      listenable: themeModel,
      builder: (context, child) => MaterialApp(
        themeMode: themeModel.isDark ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierCartItemPage(),
        // ChangeNotifierPage(
        //   counterAndColorModel: counterModel,
        //   themeModel: themeModel,
        // ),
      ),
    );
  }
}
