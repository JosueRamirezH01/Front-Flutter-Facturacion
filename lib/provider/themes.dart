import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  late bool _isDarkMode;

  ThemeProvider() {
    _isDarkMode = false; // Default to light mode
    loadThemeFromPreferences();
  }

  bool get isDarkMode => _isDarkMode;

  ThemeData get currentTheme {
    return _isDarkMode ? ThemeData.dark() : ThemeData.light();
  }

  // Cargar el tema guardado de SharedPreferences
  Future<void> loadThemeFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false; // Falso si no está guardado
    notifyListeners(); // Notificar a los listeners para que el tema se actualice
  }

  // Cambiar el tema y guardar la preferencia
  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
    notifyListeners(); // Notificar para que el cambio surta efecto
  }
}
