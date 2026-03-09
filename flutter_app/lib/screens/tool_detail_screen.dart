import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/hearhub_button.dart';

class ToolDetailScreen extends StatelessWidget {
  const ToolDetailScreen({super.key, required this.toolId});

  final String toolId;

  static const _tools = <String, _ToolDetail>{
    'sound-amplifier': _ToolDetail(
      name: 'Sound Amplifier',
      tagline: 'Turn quiet sounds into clear audio around you.',
      icon: LucideIcons.volume_2,
      helpsWith: [
        'Follow conversations in noisy cafes or restaurants.',
        'Hear the TV, announcements, or alarms more clearly.',
      ],
      steps: [
        'Open the Sound Amplifier app on your phone.',
        'Connect your headphones and point your phone towards the sound source.',
        'Adjust the volume and noise reduction until voices feel clear.',
      ],
      contexts: ['Cafés & Restaurants', 'At Home', 'Public spaces'],
      imageAsset: 'assets/images/sound_amplifier.png',
    ),
    'hearing-test-pro': _ToolDetail(
      name: 'Hearing Test Pro',
      tagline: 'Check your hearing in a few minutes.',
      icon: LucideIcons.ear,
      helpsWith: [
        'Understand which sounds are harder for you to hear.',
        'Track changes in your hearing over time.',
      ],
      steps: [
        'Find a quiet room and plug in your headphones.',
        'Follow the on‑screen prompts and tap when you hear a sound.',
        'Review your results and save them for your next check‑up.',
      ],
      contexts: ['Doctor visits', 'At home', 'Before appointments'],
      imageAsset: 'assets/images/hearing_test_pro.png',
    ),
    'noise-reducer': _ToolDetail(
      name: 'Noise Reducer',
      tagline: 'Reduce background noise so voices stand out.',
      icon: LucideIcons.headphones,
      helpsWith: [
        'Cut down air‑conditioner or traffic noise.',
        'Focus on the person talking during calls or meetings.',
      ],
      steps: [
        'Open the Noise Reducer app and put on your headphones.',
        'Choose the scene that matches where you are (office, street, home).',
        'Fine‑tune the sliders until voices feel comfortable.',
      ],
      contexts: ['Work meetings', 'Commuting', 'Open offices'],
      imageAsset: 'assets/images/noise_reducer.png',
    ),
  };

  @override
  Widget build(BuildContext context) {
    final detail = _tools[toolId] ?? _tools.values.first;

    return MobileLayout(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header row
                Row(
                  children: [
                    IconButton(
                      onPressed: () => context.go('/dashboard'),
                      icon: const Icon(LucideIcons.chevron_left, color: AppColors.foreground),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Tool Details',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.foreground,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Icon + title
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: const BoxDecoration(
                          color: AppColors.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(detail.icon, size: 32, color: AppColors.primary),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        detail.name,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.foreground,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        detail.tagline,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.mutedForeground,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Hero image
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      detail.imageAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // What this tool helps with
                Text(
                  'What this tool helps with',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.foreground,
                      ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: detail.helpsWith
                      .map(
                        (text) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.card,
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Text(
                            text,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.foreground,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),

                const SizedBox(height: 24),

                // Primary CTA
                HearHubButton(
                  onPressed: () {},
                  child: const Text('Start using tool'),
                ),

                const SizedBox(height: 32),

                // How to start section
                Text(
                  'How to start in 2 minutes',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.foreground,
                      ),
                ),
                const SizedBox(height: 16),
                ...detail.steps.asMap().entries.map(
                  (entry) {
                    final index = entry.key + 1;
                    final text = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '$index',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryForeground,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              text,
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.foreground,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 16),

                // Context chips
                if (detail.contexts.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: detail.contexts
                        .map(
                          (c) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              c,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ToolDetail {
  const _ToolDetail({
    required this.name,
    required this.tagline,
    required this.icon,
    required this.helpsWith,
    required this.steps,
    required this.contexts,
    required this.imageAsset,
  });

  final String name;
  final String tagline;
  final IconData icon;
  final List<String> helpsWith;
  final List<String> steps;
  final List<String> contexts;
  final String imageAsset;
}

