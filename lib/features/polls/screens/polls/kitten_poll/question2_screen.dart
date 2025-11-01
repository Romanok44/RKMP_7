import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/poll_question_screen.dart';

class Question2Screen extends StatelessWidget {
  final int score;
  const Question2Screen({super.key, required this.score});

  void _navigateToNext(BuildContext context, int additionalScore) {
    context.go('/kitten/question3', extra: score + additionalScore);
  }

  @override
  Widget build(BuildContext context) {
    return PollQuestionScreen(
      appBarTitle: "Вопрос 2/5",
      question: "Что ты хочешь на завтрак?",
      answers: [
        {
          'text': 'Что-нибудь вкусненькое и сладкое, чтобы порадовать себя.',
          'onPressed': () => _navigateToNext(context, 1),
        },
        {
          'text': 'Просто кофе/чай. Главное — функциональность.',
          'onPressed': () => _navigateToNext(context, 0),
        },
        {
          'text': 'Сейчас бы поймать сочную сосиску или кусочек сыра!',
          'onPressed': () => _navigateToNext(context, 2),
        },
      ],
    );
  }
}