import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staytics/features/dashboard/presentation/widgets/break_timer_section.dart';
import 'package:staytics/features/dashboard/presentation/widgets/this_week_section.dart';
import 'package:staytics/features/dashboard/presentation/widgets/timer_info_section.dart';
import '../../../../common/theme/theme_controller.dart';
import '../states/timer_state.dart';
import '../view_models/timer_view_model.dart';

class DashboardApp extends ConsumerStatefulWidget {
  const DashboardApp({super.key});

  @override
  ConsumerState<DashboardApp> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      ref.read(timerProvider.notifier).processIntent(AppPausedIntent());
    } else if (state == AppLifecycleState.resumed) {
      ref.read(timerProvider.notifier).processIntent(AppResumedIntent());
    }
  }

  @override
  Widget build(BuildContext context) {
    final timerState = ref.watch(timerProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              theme.brightness == Brightness.light
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
            ),
            onPressed: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          const SizedBox(height: 16),
          TimerInfoSection(),
          const SizedBox(height: 24),
          BreakTimeSection(),
          const SizedBox(height: 24),
          ThisWeekSection(state: timerState),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
