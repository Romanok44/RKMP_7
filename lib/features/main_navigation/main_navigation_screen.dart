import 'package:flutter/material.dart';
import '../polls/screens/start_screen.dart';
import '../polls/screens/poll_flow/category_selection_screen.dart';
import '../history/screens/history_screen.dart';
import '../settings/screens/settings_screen.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  void _navigateToScreen(BuildContext context, Widget screen, String title) {
    // ГОРИЗОНТАЛЬНАЯ НАВИГАЦИЯ - заменяем текущий экран
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => Scaffold(
          appBar: AppBar(
            title: Text(title),
            backgroundColor: Colors.blue[700],
          ),
          body: screen,
          bottomNavigationBar: _buildBottomNavigationBar(context, title),
        ),
        transitionDuration: Duration.zero,
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context, String currentTitle) {
    return BottomNavigationBar(
      currentIndex: _getCurrentIndex(currentTitle),
      onTap: (index) => _onItemTapped(context, index),
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Главная',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.quiz),
          label: 'Опросы',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'История',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Настройки',
        ),
      ],
    );
  }

  int _getCurrentIndex(String title) {
    switch (title) {
      case 'Главная': return 0;
      case 'Опросы': return 1;
      case 'История': return 2;
      case 'Настройки': return 3;
      default: return 0;
    }
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        _navigateToScreen(context, const StartScreen(), 'Главная');
        break;
      case 1:
        _navigateToScreen(context, const CategorySelectionScreen(), 'Опросы');
        break;
      case 2:
        _navigateToScreen(context, const HistoryScreen(), 'История');
        break;
      case 3:
        _navigateToScreen(context, const SettingsScreen(), 'Настройки');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная'),
        backgroundColor: Colors.blue[700],
      ),
      body: const StartScreen(),
      bottomNavigationBar: _buildBottomNavigationBar(context, 'Главная'),
    );
  }
}