import 'package:flutter/material.dart';
import 'package:staytics/features/dashboard/presentation/widgets/break_indicator.dart' show BreakIndicator;
import 'package:staytics/features/dashboard/presentation/states/timer_state.dart';
import 'package:staytics/common/widgets/custom_dialog.dart';
import 'package:staytics/common/widgets/staytics_button.dart';
import 'package:staytics/common/theme/custom_colors.dart';

class TimerSection extends StatelessWidget {
  final TimerState state;
  final Function(TimerIntent) onIntent;

  const TimerSection({super.key, required this.state, required this.onIntent});

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  String _getSubtitle() {
    switch (state.status) {
      case TimerStatus.tracking:
        return 'Tracking time';
      case TimerStatus.breakTime:
        return 'Break time';
      case TimerStatus.ready:
        return 'Ready to start?';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isTracking = state.status == TimerStatus.tracking;
    final isBreak = state.status == TimerStatus.breakTime;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Timer',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _getSubtitle(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.timer_outlined,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ],
          ),
          const SizedBox(height: 32),
          Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (isTracking) {
                    showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                        title: 'Stop Timer?',
                        description: 'Are you sure you want to stop the timer?',
                        primaryButtonText: 'Stop',
                        onPrimaryPressed: () {
                          Navigator.pop(context);
                          onIntent(StopTimerIntent());
                        },
                        secondaryButtonText: 'Cancel',
                        onSecondaryPressed: () => Navigator.pop(context),
                        primaryButtonColor: Theme.of(
                          context,
                        ).extension<SpecialColors>()?.warningColor,
                      ),
                    );
                  } else if (isBreak) {
                    // Do nothing or maybe stop break?
                  } else {
                    onIntent(StartTimerIntent());
                  }
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isTracking
                        ? Theme.of(
                            context,
                          ).extension<SpecialColors>()!.stopButtonColor
                        : Theme.of(
                            context,
                          ).extension<SpecialColors>()!.playButtonColor,
                  ),
                  child: Center(
                    child: Icon(
                      isTracking
                          ? Icons.stop_rounded
                          : Icons.play_arrow_rounded,
                      size: 48,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
              ),
              if (isBreak)
                Positioned(top: 0, right: 0, child: BreakIndicator()),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            _formatDuration(state.totalTime),
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontSize: 24),
          ),
          const SizedBox(height: 16),
          if (isTracking || isBreak)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: StayticsButton(
                text: isBreak ? 'End Break' : 'Start Break',
                icon: Icons.coffee_outlined,
                onTap: () {
                  if (isBreak) {
                    onIntent(EndBreakIntent());
                  } else {
                    onIntent(StartBreakIntent());
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}