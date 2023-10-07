import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/services/splash_services.dart';
import 'package:mvvm_getx/view/splash_screen.dart';
import 'package:mvvm_getx/view_models/theme/theme_view_model.dart';
import 'package:mockito/mockito.dart';

class MockSplashServices extends Mock implements SplashServices {}

class MockThemeChanger extends Mock implements ThemeChanger {}

void main() {
  group('SplashScreen', () {
    late MockSplashServices mockSplashServices;
    late MockThemeChanger mockThemeChanger;

    setUp(() {
      mockSplashServices = MockSplashServices();
      mockThemeChanger = MockThemeChanger();
      Get.put(mockThemeChanger);
    });

    tearDown(() {
      Get.delete<ThemeChanger>();
    });

    testWidgets('should display the splash screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SplashScreen(),
        ),
      );

      expect(find.text('welcome_to_royal_cyber_world'), findsOneWidget);
    });

    testWidgets('should call isLogin on splash screen init',
        (WidgetTester tester) async {
      when(mockSplashServices.isLogin()).thenAnswer((_) => Future.value(true));
      await tester.pumpWidget(
        MaterialApp(
          home: SplashScreen(),
        ),
      );

      verify(mockSplashServices.isLogin()).called(1);
    });

    testWidgets('should call getThemeStatus on splash screen init',
        (WidgetTester tester) async {
      when(mockThemeChanger.getThemeStatus())
          .thenAnswer((_) => Future.value(true));
      await tester.pumpWidget(
        MaterialApp(
          home: SplashScreen(),
        ),
      );

      verify(mockThemeChanger.getThemeStatus()).called(1);
    });

    // testWidgets('should update locale on splash screen init',
    //     (WidgetTester tester) async {
    //   when(mockThemeChanger.getCurrentLanguage())
    //       .thenAnswer((_) => Future.value('English'));
    //   await tester.pumpWidget(
    //     GetMaterialApp(
    //       home: SplashScreen(),
    //       translations: Messages(),
    //     ),
    //   );

    //   verify(mockThemeChanger.getCurrentLanguage()).called(1);
    //   expect(Get.locale.languageCode, 'en');
    //   expect(find.text('welcome_to_royal_cyber_world'), findsOneWidget);
    // });
  });
}
