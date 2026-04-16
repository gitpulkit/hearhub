import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/hearhub_button.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  static const _features = [
    (icon: LucideIcons.sparkles, label: 'Discover new tools', isSecondary: true),
    (icon: LucideIcons.book_open, label: 'Learn how to use them', isSecondary: false),
    (icon: LucideIcons.heart_pulse, label: 'Improve your daily life', isSecondary: true),
  ];

  @override
  Widget build(BuildContext context) {
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
                  // Hero icon
                  Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      color: AppColors.secondary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      LucideIcons.ear,
                      size: 60,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Hero text
                  Text(
                    'Welcome to HearHub',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Discover and use hearing support tools — simply.',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.mutedForeground,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  // Features
                  ..._features.map((f) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: f.isSecondary ? AppColors.secondary : AppColors.accent,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            f.icon,
                            size: 24,
                            color: f.isSecondary ? AppColors.primary : AppColors.foreground,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          f.label,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.foreground,
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HearHubButton(
                    onPressed: () => context.push('/onboarding'),
                    child: const Text('See Personalized Apps'),
                  ),
                  const SizedBox(height: 12),
                  HearHubButton(
                    variant: HearHubButtonVariant.secondary,
                    onPressed: () => context.push('/tools'),
                    child: const Text('See All Applications'),
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
