import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Constrains content to mobile width (480px) - matches React MobileLayout
class MobileLayout extends StatelessWidget {
  const MobileLayout({
    super.key,
    required this.child,
    this.padding = EdgeInsets.zero,
  });

  final Widget child;
  final EdgeInsets padding;

  static const double maxWidth = 480;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxWidth),
          child: Container(
            width: double.infinity,
            color: AppColors.background,
            child: child,
          ),
        ),
      ),
    );
  }
}
