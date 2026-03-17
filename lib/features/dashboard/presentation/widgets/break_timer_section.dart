import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staytics/common/extensions/int_ext.dart';
import 'package:staytics/features/dashboard/presentation/view_models/timer_view_model.dart';
import 'package:staytics/features/dashboard/presentation/widgets/break_stat_card.dart';
import 'package:staytics/common/theme/custom_colors.dart';

class BreakTimeSection extends ConsumerStatefulWidget {
  //final TimerState state;
  const BreakTimeSection({super.key});

  @override
  ConsumerState<BreakTimeSection> createState() => _BreakTimeSectionState();
}

class _BreakTimeSectionState extends ConsumerState<BreakTimeSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(timerProvider);

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
                'Break Time',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Icon(
                Icons.coffee_outlined,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.schedule_outlined,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Total Break Time',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  state.totalBreakSeconds.toHHMMSS(),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: BreakStatCard(
                  label: 'Breaks Today',
                  value: '${state.totalBreakCount}',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: BreakStatCard(
                  label: 'Avg Break',
                  value: state.totalBreakCount > 0
                      ? (state.totalBreakSeconds ~/ state.totalBreakCount)
                            .toHHMMSS()
                      : '0m',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Break time is excluded from total hours',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
