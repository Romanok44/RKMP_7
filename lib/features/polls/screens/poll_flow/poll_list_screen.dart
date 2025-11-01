import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PollListScreen extends StatelessWidget {
  final String category;
  const PollListScreen({super.key, required this.category});

  List<Map<String, dynamic>> _getPolls() {
    switch (category) {
      case 'funny':
        return [
          {
            'title': 'Какой ты сегодня котенок?',
            'description': 'Узнай, какой ты пушистик сегодня',
            'route': '/kitten/start',
          },
          {
            'title': 'Тест на знание мемов',
            'description': 'Проверь, насколько ты в теме интернет-культуры',
            'route': '/meme/start',
          },
          {
            'title': 'Какой бутерброд определяет твою жизнь?',
            'description': 'От классического до экстравагантного - найди свой бутерброд-судьбу',
          },
          {
            'title': 'Как хорошо ты знаешь аниме "Наруто"?',
            'description': 'Проверь свои знания о Наруто, Саске и Конохе',
          },
        ];
      case 'personality':
        return [
          {
            'title': 'Тест на тип личности',
            'description': 'Узнай свой психологический тип',
            'route': '/personality/start',
          },
          {
            'title': 'Тест Майерс-Бриггс',
            'description': 'Определи свой тип личности из 16 возможных вариантов',
          },
        ];
      case 'sociological':
        return [
          {
            'title': 'Опрос о цифровых привычках',
            'description': 'Исследование использования технологий',
            'route': '/digital/start',
          },
          {
            'title': 'Удовлетворенность смартфонами Apple',
            'description': 'Помоги улучшить продукты Apple, поделись своим опытом',
          },
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final polls = _getPolls();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Доступные опросы'),
        backgroundColor: Colors.blue[700],
      ),
      body: ListView.builder(
        itemCount: polls.length,
        itemBuilder: (context, index) {
          final poll = polls[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                poll['title'],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(poll['description']),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                if (poll['route'] != null) {
                  context.go(poll['route']!);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Этот опрос находится в разработке')),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}