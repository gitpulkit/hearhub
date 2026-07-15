import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import '../auth/state/auth_state.dart';
import '../l10n/app_localizations.dart';
import '../settings/app_settings.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/hearhub_button.dart';

class PersonalizeScreen extends StatefulWidget {
  const PersonalizeScreen({
    super.key,
    required this.authState,
    required this.appSettings,
  });

  final AuthState authState;
  final AppSettings appSettings;

  @override
  State<PersonalizeScreen> createState() => _PersonalizeScreenState();
}

class _PersonalizeScreenState extends State<PersonalizeScreen> {
  bool _reducedMotion = false;
  bool _tactileFeedback = true;
  bool _isLoggingOut = false;

  AppSettings get _settings => widget.appSettings;

  Widget _sectionLabel(String text) => Padding(
        padding: const EdgeInsets.only(left: 0, right: 0, top: 24, bottom: 8),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontSize: 12,
            color: AppColors.mutedForeground(context),
            letterSpacing: 1.2,
          ),
        ),
      );

  Future<void> _pickLanguage(AppLocalizations l10n) async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: AppColors.card(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        final sheetL10n = AppLocalizations.of(sheetContext);
        final current = _settings.languageCode;
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sheetL10n.chooseLanguage,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.foreground(sheetContext),
                  ),
                ),
                const SizedBox(height: 12),
                _languageOption(
                  sheetContext,
                  code: 'en',
                  label: sheetL10n.languageEnglish,
                  selected: current == 'en',
                ),
                _languageOption(
                  sheetContext,
                  code: 'es',
                  label: sheetL10n.languageSpanish,
                  selected: current == 'es',
                ),
              ],
            ),
          ),
        );
      },
    );
    if (selected == null) return;
    await _settings.setLocale(Locale(selected));
  }

  Widget _languageOption(
    BuildContext context, {
    required String code,
    required String label,
    required bool selected,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          color: AppColors.foreground(context),
        ),
      ),
      trailing: selected
          ? Icon(LucideIcons.check, color: AppColors.primary(context))
          : null,
      onTap: () => Navigator.of(context).pop(code),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _settings,
      builder: (context, _) {
        final l10n = AppLocalizations.of(context);
        return MobileLayout(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 32, right: 32, top: 24, bottom: 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Material(
                            color: AppColors.accent(context),
                            shape: const CircleBorder(),
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              onTap: () {
                                if (context.canPop()) {
                                  context.pop();
                                } else {
                                  context.go('/dashboard');
                                }
                              },
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Icon(
                                  LucideIcons.chevron_left,
                                  size: 18,
                                  color: AppColors.foreground(context),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            l10n.settingsAccessibility,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.mutedForeground(context),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        l10n.personalizeApp,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: AppColors.foreground(context),
                        ),
                      ),

                      _sectionLabel(l10n.visualSupport),
                      const SizedBox(height: 8),
                      Material(
                        color: AppColors.secondary(context),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Icon(
                                      LucideIcons.type,
                                      size: 20,
                                      color: AppColors.primary(context),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          l10n.textSizeAdjustment,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                AppColors.foreground(context),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          l10n.previewText,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.mutedForeground(
                                                context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Text(
                                    'A',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          AppColors.mutedForeground(context),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Slider(
                                      value: _settings.textSize,
                                      min: AppSettings.minTextSize,
                                      max: AppSettings.maxTextSize,
                                      onChanged: (v) =>
                                          _settings.setTextSize(v),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'A',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color:
                                          AppColors.mutedForeground(context),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(color: AppColors.border(context)),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 16,
                                          backgroundColor:
                                              AppColors.card(context),
                                          child: Icon(
                                            _settings.isDark
                                                ? LucideIcons.moon
                                                : LucideIcons.sun,
                                            size: 16,
                                            color: AppColors.primary(context),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                l10n.appTheme,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.foreground(
                                                      context),
                                                ),
                                              ),
                                              const SizedBox(height: 2),
                                              Text(
                                                _settings.isDark
                                                    ? l10n.themeDark
                                                    : l10n.themeLight,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color:
                                                      AppColors.mutedForeground(
                                                          context),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Switch(
                                    value: _settings.isDark,
                                    onChanged: (isDark) {
                                      _settings.setThemeMode(
                                        isDark
                                            ? ThemeMode.dark
                                            : ThemeMode.light,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      _sectionLabel(l10n.interaction),
                      const SizedBox(height: 8),
                      Material(
                        color: AppColors.accent(context),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 16,
                                        backgroundColor:
                                            AppColors.accent(context),
                                        child: Icon(
                                          LucideIcons.repeat,
                                          size: 16,
                                          color: AppColors.foreground(context),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        l10n.reducedMotion,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.foreground(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Switch(
                                    value: _reducedMotion,
                                    onChanged: (v) =>
                                        setState(() => _reducedMotion = v),
                                  ),
                                ],
                              ),
                              Divider(color: AppColors.border(context)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 16,
                                        backgroundColor:
                                            AppColors.accent(context),
                                        child: Icon(
                                          LucideIcons.zap,
                                          size: 16,
                                          color: AppColors.foreground(context),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        l10n.tactileFeedback,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.foreground(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Switch(
                                    value: _tactileFeedback,
                                    onChanged: (v) =>
                                        setState(() => _tactileFeedback = v),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      _sectionLabel(l10n.system),
                      const SizedBox(height: 8),
                      Material(
                        color: AppColors.secondary(context),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor:
                                        AppColors.secondary(context),
                                    child: Icon(
                                      LucideIcons.globe,
                                      size: 18,
                                      color: AppColors.primary(context),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        l10n.appLanguage,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.foreground(context),
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        l10n.languageDisplayName(
                                            _settings.languageCode),
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.mutedForeground(
                                              context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () => _pickLanguage(l10n),
                                child: Text(
                                  l10n.change,
                                  style: TextStyle(
                                      color: AppColors.primary(context)),
                                ),
                              ),
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
                        child: Text(
                          _isLoggingOut ? l10n.loggingOut : l10n.logout,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: BottomNav(),
              ),
            ],
          ),
        );
      },
    );
  }
}
