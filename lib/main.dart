import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:view_ref/app_theme.dart';
import 'package:view_ref/main_screen.dart';
import 'package:view_ref/riverpod/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settings');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // Riverpod üzerinden tema modu
      themeMode: themeMode,

      // Light ve Dark temalar AppTheme üzerinden
      theme: AppTheme.themeData(ThemeMode.light),
      darkTheme: AppTheme.themeData(ThemeMode.dark),

      home: Dashboard(),
    );
  }
}