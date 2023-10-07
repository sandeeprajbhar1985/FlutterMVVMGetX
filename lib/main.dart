import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/res/colors/app_color.dart';
import 'package:mvvm_getx/res/getx_loclization/languages.dart';
import 'package:mvvm_getx/res/routes/routes.dart';
import 'view_models/theme/theme_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //"email": "eve.holt@reqres.in",
  //"password": "cityslicka"

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeChanger = Get.put(ThemeChanger());
    themeChanger.getThemeStatus();

    return GetMaterialApp(
      theme: AppColor.lightTheme,
      darkTheme: AppColor.darkTheme,
      themeMode: ThemeMode.system,
      title: 'Flutter Demo',
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
