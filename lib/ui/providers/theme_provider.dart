import 'package:flutter/material.dart';
import 'package:islami_sun_c10/ui/utils/app_assets.dart';
import 'package:islami_sun_c10/ui/utils/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentThemeMode = ThemeMode.light;
  late SharedPreferences storageTheme;

  Future <void> getTheme () async {
    storageTheme = await SharedPreferences.getInstance();
    if (storageTheme.getBool("isDark") ?? false){
      currentThemeMode = ThemeMode.dark ;
    }else{
      currentThemeMode = ThemeMode.light ;
    }
  }

  toggleTheme(bool darkThemeSwitchValue){
    currentThemeMode = darkThemeSwitchValue ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    bool isDark = currentThemeMode == ThemeMode.dark ? true : false ;
    _saveTheme(isDark);
  }
  bool get isLightModeEnabled => currentThemeMode == ThemeMode.light;

  String get mainBackground =>
    isLightModeEnabled ? AppAssets.background : AppAssets.darkBackground;

  TextStyle get appBarTextStyle =>
      isLightModeEnabled ? AppTheme.appBarTextStyle : AppTheme.appBarDarkTextStyle;

  TextStyle get mediumTitleTextStyle =>
      isLightModeEnabled ? AppTheme.mediumTitleTextStyle : AppTheme.mediumTitleDarkTextStyle;

  TextStyle get regularTitleTextStyle =>
      isLightModeEnabled ? AppTheme.regularTitleTextStyle : AppTheme.regularTitleDarkTextStyle;

  void _saveTheme (bool isDark) {
    storageTheme.setBool("isDark", isDark);
  }
}