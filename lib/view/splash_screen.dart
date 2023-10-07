import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/splash_services.dart';
import '../view_models/theme/theme_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();
  final themeChanger = Get.put(ThemeChanger());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin();
    themeChanger.getThemeStatus();
    themeChanger.getCurrentLanguage().then((value) {
      Get.updateLocale(value == 'English'
          ? const Locale('en', 'US')
          : const Locale('ur', 'PK'));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/rc_logo.png'),
              const SizedBox(height: 40),
              Text(
                'welcome_to_royal_cyber_world'.tr,
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
