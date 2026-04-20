import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension HearHubNavigation on BuildContext {
  /// Pops the current route if possible; otherwise routes to [fallbackLocation].
  ///
  /// This preserves natural back-stack behavior for "drill-in" screens while
  /// still supporting direct deep-links (where there may be nothing to pop).
  void popOrGo(String fallbackLocation) {
    final router = GoRouter.of(this);
    if (router.canPop()) {
      router.pop();
    } else {
      router.go(fallbackLocation);
    }
  }
}

