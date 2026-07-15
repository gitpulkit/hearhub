import 'package:go_router/go_router.dart';
import 'auth/state/auth_state.dart';
import 'settings/app_settings.dart';
import 'screens/index_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/guide_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/personalize_screen.dart';
import 'screens/saved_screen.dart';
import 'screens/assessment_screen.dart';
import 'screens/not_found_screen.dart';
import 'screens/tool_detail_screen.dart';
import 'screens/discover_screen.dart';
import 'screens/search_screen.dart';
import 'screens/onboarding_step2_screen.dart';
import 'screens/onboarding_step3_screen.dart';
import 'screens/tools_screen.dart';

GoRouter createAppRouter(AuthState authState, AppSettings appSettings) =>
    GoRouter(
  initialLocation: '/',
  refreshListenable: authState,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const IndexScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/onboarding/hearing/:category',
      builder: (context, state) {
        final category = state.pathParameters['category'] ?? 'student';
        return OnboardingStep2Screen(category: category);
      },
    ),
    GoRoute(
      path: '/onboarding/environments/:category',
      builder: (context, state) {
        final category = state.pathParameters['category'] ?? 'student';
        return OnboardingStep3Screen(category: category);
      },
    ),
    GoRoute(
      path: '/guide/:category',
      builder: (context, state) {
        final category = state.pathParameters['category'] ?? 'student';
        return GuideScreen(category: category);
      },
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/discover',
      builder: (context, state) => const DiscoverScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/saved',
      builder: (context, state) => const SavedScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => PersonalizeScreen(
        authState: authState,
        appSettings: appSettings,
      ),
    ),
    GoRoute(
      path: '/assessment/:scenario',
      builder: (context, state) {
        final scenario = state.pathParameters['scenario'] ?? 'restaurant';
        return AssessmentScreen(scenario: scenario);
      },
    ),
    GoRoute(
      path: '/tools',
      builder: (context, state) {
        final scenario = state.uri.queryParameters['scenario'];
        return ToolsScreen(scenario: scenario);
      },
    ),
    GoRoute(
      path: '/tool/:toolId',
      builder: (context, state) {
        final toolId = state.pathParameters['toolId'] ?? 'sound-amplifier';
        return ToolDetailScreen(toolId: toolId);
      },
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
