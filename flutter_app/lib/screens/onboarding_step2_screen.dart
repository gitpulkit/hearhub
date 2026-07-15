import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../utils/navigation.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/hearhub_button.dart';

class OnboardingStep2Screen extends StatefulWidget {
  const OnboardingStep2Screen({super.key, required this.category});

  final String category;

  @override
  State<OnboardingStep2Screen> createState() => _OnboardingStep2ScreenState();
}

class _OnboardingStep2ScreenState extends State<OnboardingStep2Screen> {
  String? _selected;

  static const _levels = [
    (
      id: 'mild',
      icon: LucideIcons.volume_1,
      label: 'Mild difficulty',
      desc: 'I sometimes miss words in noisy places.',
      isSecondary: true,
    ),
    (
      id: 'moderate',
      icon: LucideIcons.volume_2,
      label: 'Moderate difficulty',
      desc: 'I often ask people to repeat themselves.',
      isSecondary: false,
    ),
    (
      id: 'severe',
      icon: LucideIcons.volume_x,
      label: 'Severe difficulty',
      desc: 'I struggle to hear even in quiet environments.',
      isSecondary: true,
    ),
    (
      id: 'profound',
      icon: LucideIcons.ear_off,
      label: 'Profound loss',
      desc: 'I rely on visual cues or assistive devices.',
      isSecondary: false,
    ),
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
              // Back button
              GestureDetector(
                onTap: () => context.popOrGo('/onboarding'),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.card(context),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.border(context)),
                  ),
                  child: Icon(
                    LucideIcons.arrow_left,
                    size: 24,
                    color: AppColors.foreground(context),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Progress bar — 50%
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: LinearProgressIndicator(
                  value: 0.50,
                  backgroundColor: AppColors.secondary(context),
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary(context)),
                  minHeight: 8,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Step 2 of 4',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.mutedForeground(context),
                ),
              ),
              const SizedBox(height: 24),

              Text(
                'How is your hearing?',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground(context),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'This helps us suggest the most useful tools.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.mutedForeground(context),
                ),
              ),
              const SizedBox(height: 24),

              // Cards
              Expanded(
                child: ListView.separated(
                  itemCount: _levels.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, i) {
                    final l = _levels[i];
                    final isSelected = _selected == l.id;
                    return GestureDetector(
                      onTap: () => setState(() => _selected = l.id),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.card(context),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary(context)
                                : AppColors.border(context),
                            width: 2,
                          ),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: AppColors.primary(context)
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
                                color: l.isSecondary
                                    ? AppColors.secondary(context)
                                    : AppColors.accent(context),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                l.icon,
                                size: 24,
                                color: l.isSecondary
                                    ? AppColors.primary(context)
                                    : AppColors.foreground(context),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l.label,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.foreground(context),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    l.desc,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.mutedForeground(context),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              isSelected
                                  ? LucideIcons.circle_check
                                  : LucideIcons.circle,
                              size: 20,
                              color: isSelected
                                  ? AppColors.primary(context)
                                  : AppColors.border(context),
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
                  onPressed: _selected != null
                      ? () => context.push(
                            '/onboarding/environments/${widget.category}',
                          )
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
