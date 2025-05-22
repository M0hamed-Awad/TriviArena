import 'package:flutter/material.dart';
import 'package:trivi_arena/constants.dart';

class QuizProgressBar extends StatefulWidget {
  final int currentQuestionNumber;
  final int quizNumberOfQuestions;
  const QuizProgressBar({
    super.key,
    required this.currentQuestionNumber,
    required this.quizNumberOfQuestions,
  });

  @override
  State<QuizProgressBar> createState() => QuizProgressBarState();
}

class QuizProgressBarState extends State<QuizProgressBar> {
  @override
  Widget build(BuildContext context) {
    return _buildQuizProgressBar(
      progress: _getQuizProgress(
        currentQuestionNumber: widget.currentQuestionNumber,
        quizNumberOfQuestions: widget.quizNumberOfQuestions,
      ),
    );
  }

  Widget _buildQuizProgressBar({required double progress}) {
    setState(() {
      progress = _handleProgressValueUpperAndLowerBounds(progress: progress);
    });
    return LinearProgressIndicator(
      value: progress,
      backgroundColor: Colors.grey[300],
      color: kPrimaryColor,
      minHeight: 18,
      borderRadius: BorderRadius.circular(8),
    );
  }

  double _handleProgressValueUpperAndLowerBounds({required double progress}) {
    if (progress > 1) {
      progress = 1;
    } else if (progress < 0) {
      progress = 0;
    }
    return progress;
  }

  double _getQuizProgress({
    required int quizNumberOfQuestions,
    required int currentQuestionNumber,
  }) {
    double progress = (currentQuestionNumber / quizNumberOfQuestions);
    return progress;
  }
}
