import 'package:flutter/material.dart';
import 'app_settings.dart';

/// Exposes [AppSettings] and rebuilds dependents as soon as preferences change.
class SettingsScope extends InheritedNotifier<AppSettings> {
  const SettingsScope({
    super.key,
    required AppSettings settings,
    required super.child,
  }) : super(notifier: settings);

  static AppSettings of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<SettingsScope>();
    assert(scope != null, 'SettingsScope not found');
    return scope!.notifier!;
  }

  static AppSettings? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SettingsScope>()
        ?.notifier;
  }
}
