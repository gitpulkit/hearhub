import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'auth/state/auth_state.dart';
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
  await authState.initialize();
  runApp(HearHubApp(authState: authState));
}

class HearHubApp extends StatelessWidget {
  const HearHubApp({
    super.key,
    required this.authState,
  });

  final AuthState authState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'HearHub',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: createAppRouter(authState),
    );
  }
}
