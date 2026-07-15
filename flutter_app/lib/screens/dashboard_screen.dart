import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import '../l10n/app_localizations.dart';
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final situations = [
      (id: 'restaurant', label: l10n.scenarioRestaurant, icon: LucideIcons.utensils, isSecondary: true),
      (id: 'meeting', label: l10n.scenarioMeeting, icon: LucideIcons.users, isSecondary: false),
      (id: 'classroom', label: l10n.scenarioClassroom, icon: LucideIcons.graduation_cap, isSecondary: true),
      (id: 'home', label: l10n.scenarioHome, icon: LucideIcons.house, isSecondary: false),
    ];
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
                            l10n.goodMorning,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.mutedForeground(context),
                            ),
                          ),
                          Text(
                            l10n.helloUser,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.foreground(context),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.accent(context),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'U',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.foreground(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  // Top Picks
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.topPicks,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.foreground(context),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.push('/tools'),
                        child: Row(
                          children: [
                            Text(
                              l10n.seeAll,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary(context),
                              ),
                            ),
                            SizedBox(width: 2),
                            Icon(LucideIcons.chevron_right,
                                size: 14, color: AppColors.primary(context)),
                          ],
                        ),
                      ),
                    ],
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
                            color: AppColors.card(context),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: AppColors.border(context)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: AppColors.secondary(context),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(p.icon, size: 24, color: AppColors.primary(context)),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                p.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: AppColors.foreground(context),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                p.desc,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.mutedForeground(context),
                                ),
                              ),
                              const SizedBox(height: 12),
                              HearHubButton(
                                onPressed: () {},
                                minHeight: 40,
                                borderRadius: 24,
                                isExpanded: true,
                                child: Text(
                                  l10n.getLabel,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              HearHubButton(
                                onPressed: () => context.push('/tool/${p.id}'),
                                minHeight: 36,
                                borderRadius: 24,
                                isExpanded: true,
                                variant: HearHubButtonVariant.secondary,
                                child: Text(
                                  l10n.learnMore,
                                  style: const TextStyle(
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
                  SizedBox(height: 32),
                  // Daily Situations
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.dailySituations,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.foreground(context),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.push('/tools'),
                        child: Row(
                          children: [
                            Text(
                              l10n.browseTools,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary(context),
                              ),
                            ),
                            SizedBox(width: 2),
                            Icon(LucideIcons.chevron_right,
                                size: 14, color: AppColors.primary(context)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    mainAxisExtent: 140,
                    children: situations.map((s) {
                      return GestureDetector(
                        onTap: () => context.push('/assessment/${s.id}'),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.card(context),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: AppColors.border(context)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: s.isSecondary ? AppColors.secondary(context) : AppColors.accent(context),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  s.icon,
                                  size: 24,
                                  color: s.isSecondary ? AppColors.primary(context) : AppColors.foreground(context),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                s.label,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.foreground(context),
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
