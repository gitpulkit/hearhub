import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/hearhub_button.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key, required this.category});

  final String category;

  static const _tools = [
    (name: 'Live Transcribe', desc: 'Real-time speech to text for lectures and meetings.', icon: LucideIcons.mic),
    (name: 'Otter.ai', desc: 'AI-powered note-taking for students and professionals.', icon: LucideIcons.file_text),
  ];

  static const _steps = [
    'Download the app from your app store.',
    'Open it during your next lecture or meeting.',
    'Review your transcription and share notes.',
  ];

  String get _title {
    switch (category) {
      case 'student': return 'For Students';
      case 'professional': return 'For Professionals';
      case 'parent': return 'For Parents';
      case 'senior': return 'For Seniors';
      default: return 'For Students';
    }
  }

  String get _subtitle {
    switch (category) {
      case 'student': return 'Tools and tips to help you in the classroom.';
      case 'professional': return 'Tools and tips for the workplace.';
      case 'parent': return 'Tools and tips for family life.';
      case 'senior': return 'Tools and tips for everyday life.';
      default: return 'Tools and tips to help you.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, top: 24, bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  GestureDetector(
                    onTap: () => context.go('/onboarding'),
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
                  const SizedBox(height: 24),
                  Text(
                    _title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _subtitle,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.mutedForeground,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Recommended tools
                  Text(
                    'Recommended Tools',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _tools.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 16),
                      itemBuilder: (context, i) {
                        final t = _tools[i];
                        return Container(
                          width: 220,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.card,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: const BoxDecoration(
                                  color: AppColors.accent,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(t.icon, size: 24, color: AppColors.foreground),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                t.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.foreground,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                t.desc,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.mutedForeground,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Video section
                  Text(
                    'Watch How It Works',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 16),
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.8),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(LucideIcons.play, size: 32, color: AppColors.primaryForeground),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.foreground.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      'Professor: "Today we will study..."',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'monospace',
                        color: AppColors.primaryForeground,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // How to use
                  Text(
                    'How to Use',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ..._steps.asMap().entries.map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${e.key + 1}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: AppColors.primaryForeground,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              e.value,
                              style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.foreground,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
          // Fixed CTA
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 480),
              padding: const EdgeInsets.all(32),
              color: AppColors.background,
              child: HearHubButton(
                onPressed: () => context.go('/dashboard'),
                child: const Text('Try these tools'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
