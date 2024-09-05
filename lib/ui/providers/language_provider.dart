import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LanguageProvider extends ChangeNotifier{
  String currentLocale = "en";
  late SharedPreferences storageLang;

  Future <void> getLang () async {
    storageLang = await SharedPreferences.getInstance();
    if (storageLang.getBool("isArabic") ?? false){
      currentLocale =  "ar" ;
    }else{
      currentLocale =  "en" ;
    }
  }

  void setCurrentLocale(String newLocale){
    currentLocale = newLocale;
    notifyListeners();
    bool isArabic = newLocale == const Locale("ar") ? true : false ;
    _savedLang(isArabic);
  }
  void _savedLang (bool isArabic) {
    storageLang.setBool("isArabic", isArabic) ;
  }
}