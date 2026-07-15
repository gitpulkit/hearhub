import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'auth/state/auth_state.dart';
import 'l10n/app_localizations.dart';
import 'settings/app_settings.dart';
import 'settings/settings_scope.dart';
import 'theme/app_theme.dart';
import 'router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  final authState = AuthState();
  final appSettings = AppSettings();
  await Future.wait([
    authState.initialize(),
    appSettings.initialize(),
  ]);
  runApp(HearHubApp(authState: authState, appSettings: appSettings));
}

class HearHubApp extends StatefulWidget {
  const HearHubApp({
    super.key,
    required this.authState,
    required this.appSettings,
  });

  final AuthState authState;
  final AppSettings appSettings;

  @override
  State<HearHubApp> createState() => _HearHubAppState();
}

class _HearHubAppState extends State<HearHubApp> {
  late final GoRouter _router = createAppRouter(
    widget.authState,
    widget.appSettings,
  );

  @override
  void initState() {
    super.initState();
    widget.appSettings.addListener(_onSettingsChanged);
  }

  @override
  void dispose() {
    widget.appSettings.removeListener(_onSettingsChanged);
    super.dispose();
  }

  void _onSettingsChanged() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final settings = widget.appSettings;
    return MaterialApp.router(
      title: 'HearHub',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settings.themeMode,
      locale: settings.locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: _router,
      builder: (context, child) {
        final isDark = settings.isDark;
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness:
                isDark ? Brightness.light : Brightness.dark,
            systemNavigationBarColor:
                isDark ? const Color(0xFF16141C) : const Color(0xFFF5F4F2),
            systemNavigationBarIconBrightness:
                isDark ? Brightness.light : Brightness.dark,
          ),
        );
        return SettingsScope(
          settings: settings,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.linear(settings.textScaleFactor),
            ),
            child: child ?? const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
