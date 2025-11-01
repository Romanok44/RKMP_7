import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/polls/state/history_service.dart';
import 'shared/app_theme.dart';
import 'router/app_router.dart';

class PollApp extends StatelessWidget {
  const PollApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HistoryService(),
      child: MaterialApp.router(
        title: 'Poll Tracker',
        theme: AppTheme.themeData,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}