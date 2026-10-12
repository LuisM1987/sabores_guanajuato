import 'package:flutter/material.dart';

/// Paleta cálida (terracota y crema) acorde con el tema de cocina.
class AppTheme {
  static const Color primario = Color(0xFFC1440E);
  static const Color fondo = Color(0xFFFFF8F0);

  static ThemeData get tema {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: primario),
      scaffoldBackgroundColor: fondo,
      appBarTheme: const AppBarTheme(
        backgroundColor: primario,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}
