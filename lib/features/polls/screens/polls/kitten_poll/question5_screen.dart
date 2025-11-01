import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/poll_question_screen.dart';

class Question5Screen extends StatelessWidget {
  final int score;
  const Question5Screen({super.key, required this.score});

  void _navigateToNext(BuildContext context, int additionalScore) {
    context.go('/kitten/result', extra: {
      'score': score + additionalScore,
      'pollId': 'kitten_poll',
      'pollTitle': 'Какой ты сегодня котенок?',
      'pollCategory': 'Смешные опросы',
    });
  }

  @override
  Widget build(BuildContext context) {
    return PollQuestionScreen(
      appBarTitle: "Вопрос 5/5",
      question: "Вечер настал. Чем займешься?",
      answers: [
        {
          'text': 'Устройлю игровую сессию (игры, сериалы, хобби).',
          'onPressed': () => _navigateToNext(context, 1),
        },
        {
          'text': 'Позвоню другу, чтобы поболтать и поделиться новостями.',
          'onPressed': () => _navigateToNext(context, 2),
        },
        {
          'text': 'Меня никто не найдет. Я в домике и отдыхаю от всех.',
          'onPressed': () => _navigateToNext(context, -1),
        },
      ],
    );
  }
}