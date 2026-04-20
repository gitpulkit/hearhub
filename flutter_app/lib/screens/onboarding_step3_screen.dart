import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../utils/navigation.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/hearhub_button.dart';

class OnboardingStep3Screen extends StatefulWidget {
  const OnboardingStep3Screen({super.key, required this.category});

  final String category;

  @override
  State<OnboardingStep3Screen> createState() => _OnboardingStep3ScreenState();
}

class _OnboardingStep3ScreenState extends State<OnboardingStep3Screen> {
  final Set<String> _selected = {};

  static const _environments = [
    (
      id: 'work',
      icon: LucideIcons.briefcase,
      label: 'Work',
      desc: 'Meetings, open offices, calls.',
      isSecondary: true,
    ),
    (
      id: 'school',
      icon: LucideIcons.graduation_cap,
      label: 'School',
      desc: 'Lectures, classrooms, group discussions.',
      isSecondary: false,
    ),
    (
      id: 'home',
      icon: LucideIcons.house,
      label: 'Home',
      desc: 'TV, doorbells, family conversations.',
      isSecondary: true,
    ),
    (
      id: 'social',
      icon: LucideIcons.users,
      label: 'Social',
      desc: 'Restaurants, gatherings, public spaces.',
      isSecondary: false,
    ),
    (
      id: 'outdoors',
      icon: LucideIcons.map_pin,
      label: 'Outdoors',
      desc: 'Streets, transit, sports, events.',
      isSecondary: true,
    ),
  ];

  void _toggle(String id) {
    setState(() {
      if (_selected.contains(id)) {
        _selected.remove(id);
      } else {
        _selected.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              GestureDetector(
                onTap: () => context.popOrGo(
                  '/onboarding/hearing/${widget.category}',
                ),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.border),
                  ),
                  child: const Icon(
                    LucideIcons.arrow_left,
                    size: 24,
                    color: AppColors.foreground,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Progress bar — 75%
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: const LinearProgressIndicator(
                  value: 0.75,
                  backgroundColor: AppColors.secondary,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                  minHeight: 8,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Step 3 of 4',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.mutedForeground,
                ),
              ),
              const SizedBox(height: 24),

              Text(
                'Where do you need help most?',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Select all environments that apply.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.mutedForeground,
                ),
              ),
              const SizedBox(height: 24),

              // Cards — multi-select
              Expanded(
                child: ListView.separated(
                  itemCount: _environments.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, i) {
                    final e = _environments[i];
                    final isSelected = _selected.contains(e.id);
                    return GestureDetector(
                      onTap: () => _toggle(e.id),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.border,
                            width: 2,
                          ),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: AppColors.primary
                                        .withValues(alpha: 0.15),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ]
                              : null,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: e.isSecondary
                                    ? AppColors.secondary
                                    : AppColors.accent,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                e.icon,
                                size: 24,
                                color: e.isSecondary
                                    ? AppColors.primary
                                    : AppColors.foreground,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.label,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.foreground,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    e.desc,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.mutedForeground,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 150),
                              child: Icon(
                                isSelected
                                    ? LucideIcons.circle_check
                                    : LucideIcons.circle,
                                key: ValueKey(isSelected),
                                size: 20,
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.border,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 8),
                child: HearHubButton(
                  onPressed: _selected.isNotEmpty
                      ? () => context.push('/guide/${widget.category}')
                      : null,
                  child: const Text('See my guide'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
