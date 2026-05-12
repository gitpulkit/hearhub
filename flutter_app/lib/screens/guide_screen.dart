import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import '../data/tools_data.dart';
import '../theme/app_colors.dart';
import '../utils/navigation.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/hearhub_button.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key, required this.category});

  final String category;

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
      case 'caregiver': return 'For Caregivers';
      default: return 'For Students';
    }
  }

  String get _subtitle {
    switch (category) {
      case 'student': return 'Tools and tips to help you in the classroom.';
      case 'professional': return 'Tools and tips for the workplace.';
      case 'parent': return 'Tools and tips for family life.';
      case 'senior': return 'Tools and tips for everyday life.';
      case 'caregiver': return 'Tools and tips to support someone you care for.';
      default: return 'Tools and tips to help you.';
    }
  }

  List<ToolItem> get _recommendedTools {
    return getPersonalizedToolsForCategory(category);
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
                    onTap: () => context.popOrGo('/onboarding'),
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
                      itemCount: _recommendedTools.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 16),
                      itemBuilder: (context, i) {
                        final tool = _recommendedTools[i];
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => context.push('/tool/${tool.id}'),
                            borderRadius: BorderRadius.circular(24),
                            child: Container(
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
                                child: Icon(tool.icon, size: 24, color: AppColors.foreground),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                tool.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppColors.foreground,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                tool.tagline,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  height: 1.3,
                                  color: AppColors.mutedForeground,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                categoryLabels[tool.category] ?? tool.category,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                            ),
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
                  const SizedBox(
                    height: 220,
                    child: _LiveTranscribeCarousel(),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.foreground.withValues(alpha: 0.8),
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

class _LiveTranscribeStepImage extends StatelessWidget {
  const _LiveTranscribeStepImage(this.assetPath);

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      fit: BoxFit.cover,
    );
  }
}

class _LiveTranscribeCarousel extends StatefulWidget {
  const _LiveTranscribeCarousel();

  @override
  State<_LiveTranscribeCarousel> createState() => _LiveTranscribeCarouselState();
}

class _LiveTranscribeCarouselState extends State<_LiveTranscribeCarousel> {
  final _controller = PageController();
  int _currentPage = 0;
  Timer? _timer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 1500), (_) {
      if (!mounted) return;
      _currentPage = (_currentPage + 1) % 3;
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  void _stopAutoScroll() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _stopAutoScroll();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            if (_isPlaying) {
              _isPlaying = false;
              _stopAutoScroll();
            } else {
              _isPlaying = true;
              _startAutoScroll();
            }
          });
        },
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              children: const [
                _LiveTranscribeStepImage('assets/images/live_transcribe_step1.png'),
                _LiveTranscribeStepImage('assets/images/live_transcribe_step2.png'),
                _LiveTranscribeStepImage('assets/images/live_transcribe_step3.png'),
              ],
            ),
            if (!_isPlaying)
              Center(
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.9),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    LucideIcons.play,
                    size: 32,
                    color: AppColors.primaryForeground,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
