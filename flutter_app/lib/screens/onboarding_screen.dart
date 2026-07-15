import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import '../l10n/app_localizations.dart';
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categories = [
      (id: 'student', icon: LucideIcons.graduation_cap, label: l10n.roleStudent, isSecondary: true),
      (id: 'professional', icon: LucideIcons.briefcase, label: l10n.roleProfessional, isSecondary: false),
      (id: 'parent', icon: LucideIcons.users, label: l10n.roleParent, isSecondary: true),
      (id: 'senior', icon: LucideIcons.heart, label: l10n.roleSenior, isSecondary: false),
      (id: 'caregiver', icon: LucideIcons.hand_helping, label: l10n.roleCaregiver, isSecondary: true),
    ];
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
                    color: AppColors.card(context),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.border(context)),
                  ),
                  child: Icon(LucideIcons.arrow_left, size: 24, color: AppColors.foreground(context)),
                ),
              ),
              const SizedBox(height: 16),
              // Progress
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: LinearProgressIndicator(
                  value: 0.25,
                  backgroundColor: AppColors.secondary(context),
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary(context)),
                  minHeight: 8,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.step1of4,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.mutedForeground(context),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                l10n.howCanWeHelp,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground(context),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.selectOptionDescribesYou,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.mutedForeground(context),
                ),
              ),
              const SizedBox(height: 32),
              // Cards
              Expanded(
                child: ListView.separated(
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, i) {
                    final c = categories[i];
                    final isSelected = _selected == c.id;
                    return GestureDetector(
                      onTap: () => setState(() => _selected = c.id),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.card(context),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: isSelected ? AppColors.primary(context) : AppColors.border(context),
                            width: isSelected ? 2 : 2,
                          ),
                          boxShadow: isSelected
                              ? [BoxShadow(color: AppColors.primary(context).withValues(alpha: 0.2), blurRadius: 8, offset: const Offset(0, 2))]
                              : null,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: c.isSecondary ? AppColors.secondary(context) : AppColors.accent(context),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                c.icon,
                                size: 24,
                                color: c.isSecondary ? AppColors.primary(context) : AppColors.foreground(context),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                c.label,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.foreground(context),
                                ),
                              ),
                            ),
                            Icon(LucideIcons.chevron_right, size: 20, color: AppColors.mutedForeground(context)),
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
                  child: Text(l10n.continueLabel),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
