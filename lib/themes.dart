import 'package:flutter/material.dart';

class AppThemes {
  ThemeMode getMode(String theme) {
    switch (theme) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
    }
    return ThemeMode.system;
  }

  ThemeData light() {
    const Color primaryColor = Color(0xFFC3E7FF);
    const Color cardColor = Color(0xFFF1F4FB);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: primaryColor,
      indicatorColor: primaryColor,
      cardColor: cardColor,
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        indicatorColor: primaryColor,
        backgroundColor: cardColor,
        height: 64,
      ),
    );
  }

  ThemeData dark() {
    const Color primaryColor = Color(0xFF004A77);
    const Color cardColor = Color(0xFF242628);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: primaryColor,
      indicatorColor: primaryColor,
      cardColor: cardColor,
      navigationBarTheme: const NavigationBarThemeData(
        indicatorColor: primaryColor,
        height: 64,
      ),
    );
  }
}

MaterialColor _materialColor(Color color) {
  List<double> strengths = [.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (final double strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
