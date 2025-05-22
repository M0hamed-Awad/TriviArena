import 'dart:async';

class QuestionTimerHelper {
  Timer? _timer;
  double _timeLeft = 30;

  void start({
    required double duration,
    required void Function(double timeLeft, bool isTimeUp) onTick,
  }) {
    _timeLeft = duration;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _timeLeft--;

      if (_timeLeft <= 0) {
        timer.cancel();
        onTick(0, true);
      } else {
        onTick(_timeLeft, false);
      }
    });
  }

  void stop() {
    _timer?.cancel();
  }

  double get timeLeft => _timeLeft;
}
