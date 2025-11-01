import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/polls/screens/start_screen.dart' as start_screen;
import '../features/polls/screens/poll_flow/category_selection_screen.dart' as category_screen;
import '../features/polls/screens/poll_flow/poll_list_screen.dart' as poll_list_screen;
import '../features/polls/screens/polls/kitten_poll/start_screen.dart' as kitten_poll;
import '../features/polls/screens/polls/kitten_poll/question1_screen.dart' as question1_screen;
import '../features/polls/screens/polls/kitten_poll/question2_screen.dart' as question2_screen;
import '../features/polls/screens/polls/kitten_poll/question3_screen.dart' as question3_screen;
import '../features/polls/screens/polls/kitten_poll/question4_screen.dart' as question4_screen;
import '../features/polls/screens/polls/kitten_poll/question5_screen.dart' as question5_screen;
import '../features/polls/screens/polls/kitten_poll/result_screen.dart' as kitten_result_screen;
import '../features/polls/screens/polls/meme_test/start_screen.dart' as meme_test;
import '../features/polls/screens/polls/meme_test/result_screen.dart' as meme_result;
import '../features/polls/screens/polls/personality_test/start_screen.dart' as personality_test;
import '../features/polls/screens/polls/personality_test/result_screen.dart' as personality_result;
import '../features/polls/screens/polls/digital_habits/start_screen.dart' as digital_habits;
import '../features/polls/screens/polls/digital_habits/result_screen.dart' as digital_result;
import '../features/polls/widgets/rating_review_screen.dart' as rating_screen;
import '../features/history/screens/history_screen.dart' as history_screen;
import '../features/settings/screens/settings_screen.dart' as settings_screen;
import '../features/main_navigation/main_navigation_screen.dart' as main_nav;

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      // Главный экран с нижней навигацией
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return main_nav.MainNavigationScreen(navigationShell: navigationShell);
        },
        branches: [
          // Ветка 0: Главная
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const start_screen.StartScreen(),
              ),
            ],
          ),
          // Ветка 1: Опросы
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/categories',
                builder: (context, state) => const category_screen.CategorySelectionScreen(),
              ),
              GoRoute(
                path: '/polls/:category',
                builder: (context, state) {
                  final category = state.pathParameters['category']!;
                  return poll_list_screen.PollListScreen(category: category);
                },
              ),
            ],
          ),
          // Ветка 2: История
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/history',
                builder: (context, state) => const history_screen.HistoryScreen(),
              ),
            ],
          ),
          // Ветка 3: Настройки
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) => const settings_screen.SettingsScreen(),
              ),
            ],
          ),
        ],
      ),

      // ОПРОС "КОТЕНОК" - маршрутизированная навигация
      GoRoute(
        path: '/kitten/start',
        builder: (context, state) => const kitten_poll.StartScreen(),
      ),
      GoRoute(
        path: '/kitten/question1',
        builder: (context, state) => const question1_screen.Question1Screen(),
      ),
      GoRoute(
        path: '/kitten/question2',
        builder: (context, state) => question2_screen.Question2Screen(score: state.extra as int),
      ),
      GoRoute(
        path: '/kitten/question3',
        builder: (context, state) => question3_screen.Question3Screen(score: state.extra as int),
      ),
      GoRoute(
        path: '/kitten/question4',
        builder: (context, state) => question4_screen.Question4Screen(score: state.extra as int),
      ),
      GoRoute(
        path: '/kitten/question5',
        builder: (context, state) => question5_screen.Question5Screen(score: state.extra as int),
      ),
      GoRoute(
        path: '/kitten/result',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return kitten_result_screen.ResultScreen(
            totalScore: extra['score'] as int,
            pollId: extra['pollId'] as String,
            pollTitle: extra['pollTitle'] as String,
            pollCategory: extra['pollCategory'] as String,
          );
        },
      ),

      // ДРУГИЕ ОПРОСЫ - также маршрутизированная навигация
      GoRoute(
        path: '/meme/start',
        builder: (context, state) => const meme_test.MemeTestStartScreen(),
      ),
      GoRoute(
        path: '/meme/result',
        builder: (context, state) => const meme_result.MemeTestResultScreen(),
      ),
      GoRoute(
        path: '/personality/start',
        builder: (context, state) => const personality_test.PersonalityTestStartScreen(),
      ),
      GoRoute(
        path: '/personality/result',
        builder: (context, state) => const personality_result.PersonalityTestResultScreen(),
      ),
      GoRoute(
        path: '/digital/start',
        builder: (context, state) => const digital_habits.DigitalHabitsStartScreen(),
      ),
      GoRoute(
        path: '/digital/result',
        builder: (context, state) => const digital_result.DigitalHabitsResultScreen(),
      ),

      // Экран оценки
      GoRoute(
        path: '/rating',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return rating_screen.RatingReviewScreen(
            pollId: extra['pollId'] as String,
            pollTitle: extra['pollTitle'] as String,
            pollCategory: extra['pollCategory'] as String,
            pollResult: extra['pollResult'] as String,
            onComplete: extra['onComplete'] as VoidCallback,
          );
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Страница не найдена',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => GoRouter.of(context).go('/'),
              child: const Text('На главную'),
            ),
          ],
        ),
      ),
    ),
  );
}