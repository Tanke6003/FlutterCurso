import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/theme_app.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';


void main() {
  runApp(
    const ProviderScope(
      child: MainApp()
    ),
   
    );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final selectedColorIndex = ref.watch(selectedColorIndexProvider);
    return MaterialApp.router(
      title: 'Widgets App',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeApp(selectedColorIndex:selectedColorIndex,isDarkMode: isDarkMode).getTheme(),
      
    );
  }
}
