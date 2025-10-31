import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/polls/state/history_service.dart';
import 'features/main_navigation/main_navigation_screen.dart';
import 'shared/app_theme.dart';

class PollApp extends StatelessWidget {
  const PollApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HistoryService(),
      child: MaterialApp(
        title: 'Poll Tracker',
        theme: AppTheme.themeData,
        home: const MainNavigationScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}