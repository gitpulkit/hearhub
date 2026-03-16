import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/hearhub_button.dart';

class _ScenarioData {
  const _ScenarioData({
    required this.icon,
    required this.question,
    required this.subtext,
  });
  final IconData icon;
  final String question;
  final String subtext;
}

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key, required this.scenario});

  final String scenario;

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  bool _answered = false;

  static final _scenarioData = <String, _ScenarioData>{
    'restaurant': _ScenarioData(
      icon: LucideIcons.utensils,
      question: 'Do you find it hard to hear in noisy restaurants?',
      subtext: 'Consider places with loud background music or crowded tables.',
    ),
    'meeting': _ScenarioData(
      icon: LucideIcons.users,
      question: 'Do you struggle to follow conversations in meetings?',
      subtext: 'Think about conference rooms or video calls with multiple speakers.',
    ),
    'classroom': _ScenarioData(
      icon: LucideIcons.graduation_cap,
      question: 'Is it difficult to hear your teacher or professor?',
      subtext: 'Consider large lecture halls or group discussions.',
    ),
    'home': _ScenarioData(
      icon: LucideIcons.house,
      question: 'Do you have trouble hearing the TV or doorbell at home?',
      subtext: 'Think about everyday sounds you might be missing.',
    ),
  };

  void _handleAnswer({required bool yes}) {
    setState(() => _answered = true);
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      if (yes) {
        // "Yes, often" → show relevant tools for this scenario
        context.go('/tools?scenario=${widget.scenario}');
      } else {
        // "No, rarely" → back to dashboard
        context.go('/dashboard');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = _scenarioData[widget.scenario] ?? _scenarioData['restaurant']!;

    if (_answered) {
      return MobileLayout(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(LucideIcons.check, size: 48, color: AppColors.primaryForeground),
                ),
                const SizedBox(height: 24),
                Text(
                  'Thank you!',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground,
                  ),
                  textAlign: TextAlign.center,
                ),
                  const SizedBox(height: 12),
                Text(
                  'Finding the best tools for you...',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.mutedForeground,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return MobileLayout(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => context.go('/dashboard'),
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
                  const Text(
                    'Question 3 of 10',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.foreground,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.go('/dashboard'),
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mutedForeground,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Content
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: AppColors.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(data.icon, size: 48, color: AppColors.primary),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      data.question,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.foreground,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      data.subtext,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.mutedForeground,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    HearHubButton(
                      onPressed: () => _handleAnswer(yes: true),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(LucideIcons.check, size: 20, color: AppColors.primaryForeground),
                          const SizedBox(width: 12),
                          const Text('Yes, often'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    HearHubButton(
                      onPressed: () => _handleAnswer(yes: false),
                      variant: HearHubButtonVariant.accent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(LucideIcons.x, size: 20, color: AppColors.foreground),
                          const SizedBox(width: 12),
                          const Text('No, rarely'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Footer
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(LucideIcons.info, size: 16, color: AppColors.mutedForeground),
                    const SizedBox(width: 8),
                    Text(
                      'Your answers help us personalize tools.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.mutedForeground,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
