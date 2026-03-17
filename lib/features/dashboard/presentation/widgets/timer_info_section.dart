import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staytics/common/extensions/time_calc.dart';
import 'package:staytics/features/dashboard/presentation/states/timer_state.dart';
import 'package:staytics/features/dashboard/presentation/view_models/timer_view_model.dart';
import 'package:staytics/features/dashboard/presentation/widgets/info_card.dart';
import 'package:staytics/features/dashboard/presentation/widgets/timer_section.dart';
import 'package:staytics/features/settings/settings_contract.dart';
import 'package:staytics/features/settings/settings_view_model.dart';

class TimerInfoSection extends ConsumerStatefulWidget {
  const TimerInfoSection({super.key});

  @override
  ConsumerState<TimerInfoSection> createState() => _TimerInfoSectionState();
}

class _TimerInfoSectionState extends ConsumerState<TimerInfoSection> {
  @override
  Widget build(BuildContext context) {
   
    final timerState = ref.watch(timerProvider);
    final settingsState = ref.watch(settingsProvider);

    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Time Tracker',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Track your work hours efficiently',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 24),
        TimerSection(
          state: timerState,
          onIntent: ref.read(timerProvider.notifier).processIntent,
        ),
        const SizedBox(height: 24),
        if (settingsState.showEarnings)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: InfoCard(
                    icon: Icons.access_time,
                    label: 'Today',
                    value: DateTime.now().calcTodaysTime(timerState),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 1,
                color: Colors.grey.withValues(alpha: 0.3),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: InfoCard(
                    icon: Icons.attach_money_outlined,
                    label: 'Earnings',
                    value: _calculateEarnings(timerState, settingsState),
                  ),
                ),
              ),
            ],
          )
        else
          InfoCard(
            icon: Icons.access_time,
            label: 'Today',
            value: DateTime.now().calcTodaysTime(timerState),
          ),
      ],
    );
  }

  String _calculateEarnings(
    TimerState timerState,
    SettingsState settingsState,
  ) {
    return timerState.earnings;
  }
}
