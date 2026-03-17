import 'package:flutter/material.dart';
import 'package:staytics/features/dashboard/presentation/widgets/daily_stats_row_widgets.dart';
import 'package:staytics/features/dashboard/presentation/states/timer_state.dart';
import 'package:staytics/common/theme/custom_colors.dart';

class ThisWeekSection extends StatelessWidget {
  final TimerState state;
  const ThisWeekSection({super.key, this.state = const TimerState()});

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return '${hours}h ${minutes}m';
  }

  @override
  Widget build(BuildContext context) {
    // Default empty week
    final List<Map<String, dynamic>> defaultWeek = [
      {'day': 'Mon', 'seconds': 0, 'progress': 0.0},
      {'day': 'Tue', 'seconds': 0, 'progress': 0.0},
      {'day': 'Wed', 'seconds': 0, 'progress': 0.0},
      {'day': 'Thu', 'seconds': 0, 'progress': 0.0},
      {'day': 'Fri', 'seconds': 0, 'progress': 0.0},
      {'day': 'Sat', 'seconds': 0, 'progress': 0.0},
      {'day': 'Sun', 'seconds': 0, 'progress': 0.0},
    ];

    // Merge actual stats
    for (var stat in state.weeklyStats) {
      final index = defaultWeek.indexWhere((e) => e['day'] == stat['day']);
      if (index != -1) {
        // Aggregate seconds if multiple entries exist for the same day
        defaultWeek[index]['seconds'] =
            (defaultWeek[index]['seconds'] as int) + (stat['seconds'] as int);
      }
    }

    // Add current session time to today's stat
    if (state.status == TimerStatus.tracking ||
        state.status == TimerStatus.breakTime) {
      final now = DateTime.now();
      String getDayName(int weekday) {
        switch (weekday) {
          case 1:
            return 'Mon';
          case 2:
            return 'Tue';
          case 3:
            return 'Wed';
          case 4:
            return 'Thu';
          case 5:
            return 'Fri';
          case 6:
            return 'Sat';
          case 7:
            return 'Sun';
          default:
            return '';
        }
      }

      final todayName = getDayName(now.weekday);
      final index = defaultWeek.indexWhere((e) => e['day'] == todayName);
      if (index != -1) {
        defaultWeek[index]['seconds'] =
            (defaultWeek[index]['seconds'] as int) + state.totalTime.inSeconds;
      }
    }

    // Recalculate progress for all days
    for (var dayStat in defaultWeek) {
      final seconds = dayStat['seconds'] as int;
      dayStat['progress'] = (seconds / (9 * 3600)).clamp(0.0, 1.0);
    }

    final totalSeconds = defaultWeek.fold<int>(
      0,
      (sum, item) => sum + (item['seconds'] as int),
    );
    final totalDuration = Duration(seconds: totalSeconds);

    final averageSeconds = totalSeconds ~/ 7;
    final averageDuration = Duration(seconds: averageSeconds);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'This Week',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Icon(
                Icons.history_outlined,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color:
                  Theme.of(
                    context,
                  ).extension<SpecialColors>()?.customSurfaceColor ??
                  Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text(
                  'Total Hours',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  _formatDuration(totalDuration),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ...defaultWeek.map(
            (data) => Column(
              children: [
                DailyStatRow(
                  day: data['day'] as String,
                  time: _formatDuration(
                    Duration(seconds: data['seconds'] as int),
                  ),
                  progress: (data['progress'] as num).toDouble(),
                ),
                if (data != defaultWeek.last)
                  Divider(
                    color: Theme.of(context).colorScheme.outlineVariant,
                    thickness: 1,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.analytics_outlined,
                size: 16,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 8),
              Text(
                'Average: ${_formatDuration(averageDuration)} per day',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}