import 'package:staytics/features/dashboard/presentation/states/timer_state.dart';

extension TimeCalc on DateTime {
 
  String calcTodaysTime(TimerState state) {
    final todayStr = toIso8601String().substring(0, 10);

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
