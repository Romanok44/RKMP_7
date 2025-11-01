import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/poll_question_screen.dart';

class Question4Screen extends StatelessWidget {
  final int score;
  const Question4Screen({super.key, required this.score});

  void _navigateToNext(BuildContext context, int additionalScore) {
    context.go('/kitten/question5', extra: score + additionalScore);
  }

  @override
  Widget build(BuildContext context) {
    return PollQuestionScreen(
      appBarTitle: "Вопрос 4/5",
      question: "Кто-то наступил тебе на лапу в транспорте. Твоя реакция?",
      answers: [
        {
          'text': 'Спокойно отойти в сторону. Бывает.',
          'onPressed': () => _navigateToNext(context, 0),
        },
        {
          'text': 'Недовольно фыркнуть и бросить осуждающий взгляд.',
          'onPressed': () => _navigateToNext(context, -1),
        },
        {
          'text': 'Мило улыбнуться и сказать "Ничего страшного!".',
          'onPressed': () => _navigateToNext(context, 2),
        },
      ],
    );
  }
}