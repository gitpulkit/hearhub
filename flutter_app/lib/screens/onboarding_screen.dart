import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../utils/navigation.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/hearhub_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String? _selected;

  static const _categories = [
    (id: 'student', icon: LucideIcons.graduation_cap, label: 'I am a student', isSecondary: true),
    (id: 'professional', icon: LucideIcons.briefcase, label: 'I am a professional', isSecondary: false),
    (id: 'parent', icon: LucideIcons.users, label: 'I am a parent', isSecondary: true),
    (id: 'senior', icon: LucideIcons.heart, label: 'I am a senior', isSecondary: false),
    (id: 'caregiver', icon: LucideIcons.hand_helping, label: 'I am a caregiver', isSecondary: true),
  ];

  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              GestureDetector(
                onTap: () => context.popOrGo('/'),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.border),
                  ),
                  child: const Icon(LucideIcons.arrow_left, size: 24, color: AppColors.foreground),
                ),
              ),
              const SizedBox(height: 16),
              // Progress
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: const LinearProgressIndicator(
                  value: 0.25,
                  backgroundColor: AppColors.secondary,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                  minHeight: 8,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Step 1 of 4',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.mutedForeground,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'How can we help?',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Select the option that best describes you.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.mutedForeground,
                ),
              ),
              const SizedBox(height: 32),
              // Cards
              Expanded(
                child: ListView.separated(
                  itemCount: _categories.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, i) {
                    final c = _categories[i];
                    final isSelected = _selected == c.id;
                    return GestureDetector(
                      onTap: () => setState(() => _selected = c.id),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: isSelected ? AppColors.primary : AppColors.border,
                            width: isSelected ? 2 : 2,
                          ),
                          boxShadow: isSelected
                              ? [BoxShadow(color: AppColors.primary.withValues(alpha: 0.2), blurRadius: 8, offset: const Offset(0, 2))]
                              : null,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: c.isSecondary ? AppColors.secondary : AppColors.accent,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                c.icon,
                                size: 24,
                                color: c.isSecondary ? AppColors.primary : AppColors.foreground,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                c.label,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.foreground,
                                ),
                              ),
                            ),
                            const Icon(LucideIcons.chevron_right, size: 20, color: AppColors.mutedForeground),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 16),
                child: HearHubButton(
                  onPressed: _selected != null
                      ? () => context.push('/onboarding/hearing/$_selected')
                      : null,
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
