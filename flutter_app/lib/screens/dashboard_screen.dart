import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/hearhub_button.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const _topPicks = [
    (id: 'sound-amplifier', name: 'Sound Amplifier', desc: 'Boost surrounding sounds', icon: LucideIcons.volume_2),
    (id: 'hearing-test-pro', name: 'Hearing Test Pro', desc: 'Check your hearing health', icon: LucideIcons.ear),
    (id: 'noise-reducer', name: 'Noise Reducer', desc: 'Filter background noise', icon: LucideIcons.headphones),
  ];

  static const _situations = [
    (id: 'restaurant', label: 'Restaurant', icon: LucideIcons.utensils, isSecondary: true),
    (id: 'meeting', label: 'Meeting', icon: LucideIcons.users, isSecondary: false),
    (id: 'classroom', label: 'Classroom', icon: LucideIcons.graduation_cap, isSecondary: true),
    (id: 'home', label: 'Home', icon: LucideIcons.house, isSecondary: false),
  ];

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
                  // Top bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good morning',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.mutedForeground,
                            ),
                          ),
                          Text(
                            'Hello, User',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.foreground,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          color: AppColors.accent,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'U',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.foreground,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Top Picks
                  Text(
                    'Top Picks',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 260,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _topPicks.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 16),
                      itemBuilder: (context, i) {
                        final p = _topPicks[i];
                        return Container(
                          width: 200,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.card,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: const BoxDecoration(
                                  color: AppColors.secondary,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(p.icon, size: 24, color: AppColors.primary),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                p.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: AppColors.foreground,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                p.desc,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.mutedForeground,
                                ),
                              ),
                              const SizedBox(height: 12),
                              HearHubButton(
                                onPressed: () {},
                                minHeight: 40,
                                borderRadius: 24,
                                isExpanded: true,
                                child: const Text(
                                  'Get',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              HearHubButton(
                                onPressed: () => context.go('/tool/${p.id}'),
                                minHeight: 36,
                                borderRadius: 24,
                                isExpanded: true,
                                variant: HearHubButtonVariant.secondary,
                                child: const Text(
                                  'Learn more',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Daily Situations
                  Text(
                    'Daily Situations',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    mainAxisExtent: 140,
                    children: _situations.map((s) {
                      return GestureDetector(
                        onTap: () => context.go('/assessment/${s.id}'),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.card,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: s.isSecondary ? AppColors.secondary : AppColors.accent,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  s.icon,
                                  size: 24,
                                  color: s.isSecondary ? AppColors.primary : AppColors.foreground,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                s.label,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.foreground,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: const BottomNav(),
          ),
        ],
      ),
    );
  }
}
