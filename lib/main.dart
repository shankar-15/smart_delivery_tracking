import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'feature/splash/presentation/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const TracklyApp());
}

class TracklyApp extends StatelessWidget {
  const TracklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trackly',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      home: const SplashScreen(),
    );
  }
}