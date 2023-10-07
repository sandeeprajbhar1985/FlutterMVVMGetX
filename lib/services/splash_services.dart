import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../res/routes/routes_name.dart';
import '../view_models/user_preference/user_prefrence_view_model.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  void isLogin() {
    userPreference.getUser().then((value) {
      if (kDebugMode) {
        print('token ${value.token}');
      }
      if (kDebugMode) {
        print('login value ${value.isLogin}');
      }

      if (value.isLogin == false || value.isLogin.toString() == 'null') {
        Timer(
            const Duration(seconds: 3), () => Get.toNamed(RouteName.loginView));
      } else {
        Timer(
            const Duration(seconds: 3), () => Get.toNamed(RouteName.mainview));
      }
    });
  }
}
