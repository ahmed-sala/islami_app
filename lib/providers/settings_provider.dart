import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider extends ChangeNotifier {
  String currentLanguage = 'en';
  ThemeMode curentTheme = ThemeMode.light;

  void changeTheme(ThemeMode newTheme) async {
    final prefs = await SharedPreferences.getInstance();
    if (newTheme == curentTheme) {
      return;
    }
    curentTheme = newTheme;
    prefs.setString('theme', curentTheme == ThemeMode.light ? 'light' : 'dark');

    notifyListeners();
  }

  void changeLanguage(String newLang) async {
    final prefs = await SharedPreferences.getInstance();
    if (currentLanguage == newLang) {
      return;
    }
    currentLanguage = newLang;
    prefs.setString('lang', currentLanguage);
    notifyListeners();
  }

  String getMainBackground() {
    if (isDark()) {
      return 'assets/images/backgroundDark.png';
    } else {
      return 'assets/images/background.png';
    }
  }

  bool isDark() {
    return curentTheme == ThemeMode.dark;
  }

  String getmainSebhaHead() {
    return isDark()
        ? 'assets/images/sebhaHeadDark.png'
        : 'assets/images/sebhaHead.png';
  }

  String getmainSebhaBody() {
    return isDark()
        ? 'assets/images/sebhaBodyDark.png'
        : 'assets/images/sebhaBody.png';
  }
}
