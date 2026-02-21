import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

enum HearHubButtonVariant { primary, secondary, accent }

class HearHubButton extends StatelessWidget {
  const HearHubButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.variant = HearHubButtonVariant.primary,
    this.minHeight = 56,
    this.borderRadius = 24,
    this.isExpanded = true,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final HearHubButtonVariant variant;
  final double minHeight;
  final double borderRadius;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final (backgroundColor, foregroundColor) = switch (variant) {
      HearHubButtonVariant.primary => (AppColors.primary, AppColors.primaryForeground),
      HearHubButtonVariant.secondary => (AppColors.secondary, AppColors.foreground),
      HearHubButtonVariant.accent => (AppColors.accent, AppColors.foreground),
    };

    final effectiveColor = onPressed == null
        ? backgroundColor.withOpacity(0.5)
        : backgroundColor;
    final effectiveForeground = onPressed == null
        ? foregroundColor.withOpacity(0.7)
        : foregroundColor;

    final button = Material(
      color: effectiveColor,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            constraints: BoxConstraints(minHeight: minHeight),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            alignment: Alignment.center,
            child: DefaultTextStyle(
              style: TextStyle(
                color: effectiveForeground,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            child: child,
          ),
        ),
      ),
    );

    return isExpanded ? SizedBox(width: double.infinity, child: button) : button;
  }
}
