import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger extends GetxController {
  final RxBool isLightTheme = false.obs;
  final RxString currentSelectedLanguage = 'English'.obs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  saveThemeStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', isLightTheme.value);
  }

  getThemeStatus() async {
    var isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') ?? true;
    }).obs;
    isLightTheme.value = await isLight.value;
    Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }

  saveCurrentLanguage(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('currentLanguage', value);
    Get.updateLocale(value == 'English'
        ? const Locale('en', 'US')
        : const Locale('ur', 'PK'));
    currentSelectedLanguage.value = value;
  }

  Future<String?> getCurrentLanguage() async {
    var token = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('currentLanguage');
    }).obs;

    String? lang = await token.value;
    currentSelectedLanguage.value = lang!;
    return lang;
  }
}
