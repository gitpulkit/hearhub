import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import '../auth/state/auth_state.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/hearhub_button.dart';

class PersonalizeScreen extends StatefulWidget {
  const PersonalizeScreen({
    super.key,
    required this.authState,
  });

  final AuthState authState;

  @override
  State<PersonalizeScreen> createState() => _PersonalizeScreenState();
}

class _PersonalizeScreenState extends State<PersonalizeScreen> {
  double _textSize = 16;
  bool _highContrast = true;
  bool _reducedMotion = false;
  bool _tactileFeedback = true;
  bool _isLoggingOut = false;

  Widget _sectionLabel(String text) => Padding(
        padding: const EdgeInsets.only(left: 32, right: 32, top: 24, bottom: 8),
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(fontSize: 12, color: AppColors.mutedForeground, letterSpacing: 1.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, top: 24, bottom: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top bar
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(color: AppColors.accent, shape: BoxShape.circle),
                        child: const Icon(LucideIcons.chevron_left, size: 18, color: AppColors.foreground),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Settings & Accessibility', style: TextStyle(fontSize: 14, color: AppColors.mutedForeground)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const Padding(
                    padding: EdgeInsets.only(left: 32, right: 32),
                    child: Text('Personalize App', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.foreground)),
                  ),

                  // Visual Support
                  _sectionLabel('Visual Support'),
                  const SizedBox(height: 8),
                  // Card: Text Size + High Contrast
                  Material(
                    color: AppColors.secondary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                                child: const Icon(LucideIcons.type, size: 20, color: AppColors.primary),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('Text Size Adjustment', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.foreground)),
                                    SizedBox(height: 4),
                                    Text('A', style: TextStyle(fontSize: 12, color: AppColors.mutedForeground)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Text('A', style: TextStyle(color: AppColors.mutedForeground)),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Material(
                                  color: Colors.transparent,
                                  child: Slider(
                                    value: _textSize,
                                    min: 12,
                                    max: 28,
                                    onChanged: (v) => setState(() => _textSize = v),
                                    activeColor: AppColors.primary,
                                    inactiveColor: AppColors.secondary,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Text('A', style: TextStyle(color: AppColors.mutedForeground)),
                            ],
                          ),
                          const Divider(color: AppColors.border),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  CircleAvatar(radius: 16, backgroundColor: AppColors.secondary, child: Icon(LucideIcons.moon, size: 16, color: AppColors.primary)),
                                  SizedBox(width: 12),
                                  Text('High-Contrast Mode', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.foreground)),
                                ],
                              ),
                              Switch(value: _highContrast, onChanged: (v) => setState(() => _highContrast = v), activeColor: AppColors.primary),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Interaction
                  _sectionLabel('Interaction'),
                  const SizedBox(height: 8),
                  Material(
                    color: AppColors.accent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: const [
                                CircleAvatar(radius: 16, backgroundColor: AppColors.accent, child: Icon(LucideIcons.repeat, size: 16, color: AppColors.foreground)),
                                SizedBox(width: 12),
                                Text('Reduced Motion', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.foreground)),
                              ]),
                              Switch(value: _reducedMotion, onChanged: (v) => setState(() => _reducedMotion = v), activeColor: AppColors.primary),
                            ],
                          ),
                          const Divider(color: AppColors.border),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: const [
                                CircleAvatar(radius: 16, backgroundColor: AppColors.accent, child: Icon(LucideIcons.zap, size: 16, color: AppColors.foreground)),
                                SizedBox(width: 12),
                                Text('Tactile Feedback', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.foreground)),
                              ]),
                              Switch(value: _tactileFeedback, onChanged: (v) => setState(() => _tactileFeedback = v), activeColor: AppColors.primary),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // System
                  _sectionLabel('System'),
                  const SizedBox(height: 8),
                  Material(
                    color: AppColors.secondary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: const [
                            CircleAvatar(radius: 18, backgroundColor: AppColors.secondary, child: Icon(LucideIcons.globe, size: 18, color: AppColors.primary)),
                            SizedBox(width: 12),
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text('App Language', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.foreground)),
                              SizedBox(height: 2),
                              Text('English', style: TextStyle(fontSize: 12, color: AppColors.mutedForeground)),
                            ])
                          ]),
                          TextButton(onPressed: () {}, child: const Text('Change'))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  HearHubButton(
                    onPressed: _isLoggingOut
                        ? null
                        : () async {
                            setState(() => _isLoggingOut = true);
                            await widget.authState.logout();
                            if (!context.mounted) return;
                            context.go('/');
                          },
                    variant: HearHubButtonVariant.accent,
                    child: Text(_isLoggingOut ? 'Logging out...' : 'Logout'),
                  ),
                ],
              ),
            ),
          ),
          Positioned(left: 0, right: 0, bottom: 0, child: const BottomNav()),
        ],
      ),
    );
  }
}
