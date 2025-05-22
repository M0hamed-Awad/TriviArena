import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivi_arena/constants.dart';
import 'package:trivi_arena/cubits/answer_cubit/answer_cubit.dart';
import 'package:trivi_arena/cubits/answer_cubit/answer_states.dart';
import 'package:trivi_arena/helper/question_timer_helper.dart';

class QuizTimer extends StatefulWidget {
  final double duration;
  final VoidCallback onTimeUp;
  const QuizTimer({super.key, this.duration = 30, required this.onTimeUp});

  @override
  State<QuizTimer> createState() => _QuizTimerState();
}

class _QuizTimerState extends State<QuizTimer> {
  final QuestionTimerHelper _timerHelper = QuestionTimerHelper();
  double _timeLeft = 30;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timerHelper.start(
      duration: widget.duration,
      onTick: (timeLeft, isTimeUp) {
        setState(() => _timeLeft = timeLeft);
        if (isTimeUp) widget.onTimeUp();
      },
    );
  }

  @override
  void dispose() {
    _timerHelper.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progress = _timeLeft / widget.duration;
    return Stack(
      alignment: Alignment.center,
      children: [
        BlocBuilder<AnswerCubit, AnswerState>(
          builder: (context, state) {
            if (state is AnswerSubmitted) {
              _timerHelper.stop();
            }
            
            return CircleAvatar(
              radius: 42,
              backgroundColor: kQuestionTimerBackgroundColor,
              child: Text(
                textAlign: TextAlign.center,
                "${_timeLeft.toInt()}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            );
          },
        ),
        SizedBox(
          width: 70,
          height: 70,
          child: CircularProgressIndicator(
            value: progress,
            backgroundColor: kQuestionTimerProgressIndicatorBackgroundColor,
            color: kQuestionTimerProgressIndicatorColor,
            strokeWidth: 6,
            strokeAlign: -1,
            strokeCap: StrokeCap.round,
          ),
        ),
      ],
    );
  }
}
