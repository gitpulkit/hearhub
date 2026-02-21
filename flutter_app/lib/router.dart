import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/index_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/guide_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/assessment_screen.dart';
import 'screens/not_found_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
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
      path: '/assessment/:scenario',
      builder: (context, state) {
        final scenario = state.pathParameters['scenario'] ?? 'restaurant';
        return AssessmentScreen(scenario: scenario);
      },
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
