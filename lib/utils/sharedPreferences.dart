

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'dart:convert';



class SharedPref {

  Future<void>  save (String key,  value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  void saveBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);  // Guarda como un bool
  }

  Future<bool?> readBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  Future<dynamic> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(key)) return null;

    // Intentamos obtener un valor booleano
    bool? boolValue = prefs.getBool(key);
    if (boolValue != null) {
      return boolValue;  // Si es un booleano, lo devolvemos directamente
    }

    // Si no es un booleano, intentamos leerlo como un String
    String? stringValue = prefs.getString(key);
    if (stringValue != null) {
      return json.decode(stringValue); // Decodificamos el String
    }

    return null;
  }
}

// Nombre - true - false
// SI EXISTE UN VALOR CON UNA KEY ESTABLECIDA
Future<bool> contains(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.containsKey(key);
}

Future<bool> remove(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.remove(key);
}
void logout(BuildContext context, String idUsuario) async {

  Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
}


