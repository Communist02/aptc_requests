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
