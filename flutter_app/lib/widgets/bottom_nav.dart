import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import 'mobile_layout.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final currentPath = GoRouterState.of(context).uri.path;

    final navItems = [
      (icon: LucideIcons.house, label: l10n.navHome, path: '/dashboard'),
      (icon: LucideIcons.compass, label: l10n.navDiscover, path: '/discover'),
      (icon: LucideIcons.search, label: l10n.navSearch, path: '/search'),
      (icon: LucideIcons.bookmark, label: l10n.navSaved, path: '/saved'),
      (icon: LucideIcons.settings, label: l10n.navSettings, path: '/settings'),
    ];

    return Container(
      constraints: const BoxConstraints(maxWidth: MobileLayout.maxWidth),
      decoration: BoxDecoration(
        color: AppColors.card(context),
        border: Border(top: BorderSide(color: AppColors.border(context))),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: navItems.map((item) {
              final isActive = currentPath == item.path;
              return IconButton(
                onPressed: () => context.go(item.path),
                style: IconButton.styleFrom(
                  minimumSize: const Size(48, 48),
                  foregroundColor: isActive
                      ? AppColors.primary(context)
                      : AppColors.mutedForeground(context),
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
                            ? AppColors.primary(context)
                            : AppColors.mutedForeground(context),
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
