import 'package:flutter/material.dart';
import 'package:invefacturacion/utils/sharedPreferences.dart';
class ConfiguracionController {
  late BuildContext context;
  late Function refresh;
  bool isDark = false;
  final SharedPref _pref = SharedPref();
  Future init(BuildContext context, Function refresh) async{
    this.context = context;
    this.refresh = refresh;
    _loadThemePreference();
    refresh();
  }

  void _loadThemePreference() async {
    bool? isDarkShared = await _pref.read('color');
      isDark = isDarkShared ?? false;  // Lee del SharedPreferences
  }


}