# Built-in State Management

A Flutter sample project that compares state management techniques available from
Flutter and Dart without adding external state management packages.

The examples use the same small UI idea: a counter, a background color value, and
in some variants a light/dark theme toggle. Each folder shows a different way to
own, expose, listen to, and dispose state.

## Examples

| Example | Main files | What it demonstrates |
| --- | --- | --- |
| `inherited_widget` | `InheritedWidgetApp`, `InheritedWidgetOwner`, `InheritedWidgetState` | Passing immutable state and callbacks down the widget tree with `InheritedWidget` and `setState`. |
| `inherited_notifier` | `InheritedNotifierApp`, `CounterInheritedNotifier`, `AppInheritedNotifier` | Exposing `ChangeNotifier` models through `InheritedNotifier` so dependents rebuild when the notifier changes. |
| `change_notifier` | `ChangeNotifierApp`, `ChangeNotifierPage` | Owning `ChangeNotifier` instances in a stateful app widget, listening with `ListenableBuilder`, and disposing models explicitly. |
| `value_notifier` | `ValueNotifierPage`, `ValueNotifierViewmodel` | Keeping simple independent pieces of state in `ValueNotifier` objects. |
| `value_with_inherited_notifier` | `ValueWithInheritedNotifierApp`, `ValueWithInheritedNotifierViewmodel` | Combining `ValueNotifier` with an inherited lookup so nested widgets can access notifier state without prop drilling. |

## Active App

The project currently starts the `InheritedNotifier` example:

```dart
void main() {
  runApp(InheritedNotifierApp());
}
```

To try another example, update `lib/main.dart` to import and run the desired app
widget, for example:

```dart
import 'package:built_in_state_management/change_notifier/view/change_notifier_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChangeNotifierApp());
}
```

## Project Structure

```text
lib/
  main.dart
  change_notifier/
    view/
    viewmodel/
  inherited_notifier/
    view/
    viewmodel/
  inherited_widget/
    model/
    view/
    viewmodel/
  value_notifier/
    view/
    viewmodel/
  value_with_inherited_notifier/
    view/
    viewmodel/
```

## Requirements

- Flutter SDK with Dart `^3.12.0`
- Android Studio, VS Code, or another Flutter-compatible editor
- A configured Flutter target such as Android, Linux, web, or iOS/macOS where
  supported by your local Flutter setup

## Getting Started

Install dependencies:

```sh
flutter pub get
```

Run the app:

```sh
flutter run
```

Analyze the project:

```sh
dart analyze
```

Run tests when a `test/` directory exists:

```sh
flutter test
```

## Notes

- The repository has no third-party runtime dependencies beyond Flutter itself
  and `cupertino_icons`.
- There is currently no `test/` directory.
- `lib/value_notifier/view/value_notifier_app.dart` is empty, so the standalone
  `value_notifier` example needs an app wrapper before it can be selected from
  `main.dart`.
- Some examples intentionally include comments about lifecycle ownership,
  rebuilding, and prop drilling tradeoffs while exploring the built-in APIs.
