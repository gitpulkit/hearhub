import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/hearhub_button.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final features = [
      (icon: LucideIcons.sparkles, label: l10n.featureDiscover, isSecondary: true),
      (icon: LucideIcons.book_open, label: l10n.featureLearn, isSecondary: false),
      (icon: LucideIcons.heart_pulse, label: l10n.featureImprove, isSecondary: true),
    ];

    return MobileLayout(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 32),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppColors.secondary(context),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      LucideIcons.ear,
                      size: 60,
                      color: AppColors.primary(context),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    l10n.welcomeTitle,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.foreground(context),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.welcomeSubtitle,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.mutedForeground(context),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ...features.map(
                    (f) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: f.isSecondary
                                  ? AppColors.secondary(context)
                                  : AppColors.accent(context),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              f.icon,
                              size: 24,
                              color: f.isSecondary
                                  ? AppColors.primary(context)
                                  : AppColors.foreground(context),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            f.label,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.foreground(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HearHubButton(
                    onPressed: () => context.push('/onboarding'),
                    child: Text(l10n.seePersonalizedApps),
                  ),
                  const SizedBox(height: 12),
                  HearHubButton(
                    variant: HearHubButtonVariant.secondary,
                    onPressed: () => context.push('/tools'),
                    child: Text(l10n.seeAllApplications),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
