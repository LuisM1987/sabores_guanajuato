import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';

void main() => runApp(const SaboresApp());

class SaboresApp extends StatelessWidget {
  const SaboresApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sabores de Guanajuato',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.tema,
      home: const SplashScreen(),
    );
  }
}
