import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_widget/home_widget.dart';
import 'package:staytics/features/services/home_widget_service.dart';
import 'features/main/main_screen.dart';

import 'common/theme/app_theme.dart';
import 'common/theme/theme_controller.dart';

import 'features/services/notification_service.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'data/fake_data_seeder.dart';

const bool kUseFakeData = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Remove splash first to ensure app is responsive
  FlutterNativeSplash.remove();

  await HomeWidget.setAppGroupId(HomeWidgetService.appGroupId);

  try {
    await NotificationService().init();
  } catch (e) {
    // Continue even if notification init fails
    debugPrint('NotificationService init failed: $e');
  }

  if (kUseFakeData) {
    try {
      await FakeDataSeeder.seedSessions();
    } catch (e) {
      debugPrint('FakeDataSeeder failed: $e');
    }
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      title: 'Staytics',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      home: const MainScreen(),
    );
  }
}
