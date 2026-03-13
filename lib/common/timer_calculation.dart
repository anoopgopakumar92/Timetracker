import 'package:staytics/presentation/timer/timer_state.dart';

class TimerCalculation {
  String _calculateTodayTotal(TimerState state) {
    final now = DateTime.now();
    final todayStr = now.toIso8601String().substring(0, 10);

    // Sum seconds from completed sessions today
    final completedSeconds = state.weeklyStats
        .where((s) => s['date'] == todayStr)
        .fold<int>(0, (sum, s) => sum + (s['seconds'] as int));

    // Add current session seconds
    final totalSeconds = completedSeconds + state.totalTime.inSeconds;

    final duration = Duration(seconds: totalSeconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return '$hours:$minutes:$seconds';
  }
}
