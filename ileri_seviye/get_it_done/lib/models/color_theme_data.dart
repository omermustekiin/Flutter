import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorThemeData with ChangeNotifier {
  final ThemeData _purpleTheme = ThemeData(
    primaryColor: Colors.deepPurple[300],
    primarySwatch: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.deepPurple[300],
    accentColor: Colors.deepPurpleAccent,
    appBarTheme: AppBarTheme(color: Colors.deepPurple[600]),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      subtitle1: TextStyle(color: Colors.white),
      headline3: TextStyle(color: Colors.white),
    ),
  );
  final ThemeData _indigoTheme = ThemeData(
    primaryColor: Colors.indigoAccent,
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor: Colors.indigoAccent,
    accentColor: Colors.indigoAccent,
    appBarTheme: AppBarTheme(color: Colors.indigoAccent[500]),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      subtitle1: TextStyle(color: Colors.white),
      headline3: TextStyle(color: Colors.white),
    ),
  );

  final ThemeData _selectedThemeData = ThemeData(
    primaryColor: Colors.deepPurple[300],
    primarySwatch: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.deepPurple[300],
    accentColor: Colors.deepPurpleAccent,
    appBarTheme: AppBarTheme(color: Colors.deepPurple[600]),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      subtitle1: TextStyle(color: Colors.white),
      headline3: TextStyle(color: Colors.white),
    ),
  );
  bool _isPurple = true;
  static SharedPreferences _sharedPref;

  void switchTheme(bool selected) {
    _isPurple = selected;
    saveThemeToSharedPref(selected);
    notifyListeners();
  }

  bool get isPurple => _isPurple;
  ThemeData get selectedThemeData => _isPurple ? _purpleTheme : _indigoTheme;

  Future<void> createPrefObject() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  void saveThemeToSharedPref(bool value) {
    _sharedPref.setBool('themeData', value);
  }

  void loadThemeFromSharedPref() {
    _isPurple = _sharedPref.getBool('themeData') ?? true;
  }
}
