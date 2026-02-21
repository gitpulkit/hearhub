import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import 'mobile_layout.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  static const _navItems = [
    (icon: LucideIcons.house, label: 'Home', path: '/dashboard'),
    (icon: LucideIcons.compass, label: 'Discover', path: null),
    (icon: LucideIcons.search, label: 'Search', path: null),
    (icon: LucideIcons.bookmark, label: 'Saved', path: null),
    (icon: LucideIcons.settings, label: 'Settings', path: null),
  ];

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.path;

    return Container(
      constraints: const BoxConstraints(maxWidth: MobileLayout.maxWidth),
      decoration: const BoxDecoration(
        color: AppColors.card,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _navItems.map((item) {
              final isActive = item.path != null && currentPath == item.path;
              return IconButton(
                onPressed: item.path != null
                    ? () => context.go(item.path!)
                    : null,
                style: IconButton.styleFrom(
                  minimumSize: const Size(48, 48),
                  foregroundColor: isActive
                      ? AppColors.primary
                      : AppColors.mutedForeground,
                ),
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(item.icon, size: 24),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: TextStyle(
                        fontSize: 12,
                        color: isActive
                            ? AppColors.primary
                            : AppColors.mutedForeground,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
