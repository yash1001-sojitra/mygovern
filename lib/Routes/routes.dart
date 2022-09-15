// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:mygovern/Core/Constant/string.dart';
import 'package:mygovern/Screens/Home_Screen/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/Splash_Screen/Splash/onboardingscreen.dart';
import '../Screens/Splash_Screen/Splash/splashscreen.dart';

class Routes {
  late int initScreen;
  Future<void> checkForOnBordScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    initScreen = prefs.getInt("initScreen")!;
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as dynamic;
    switch (settings.name) {

      //splash screens
      case splashScreenRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case onboardingScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const OnboardingScreen());

      // main screens
      case homepageScreenRoute:
        return MaterialPageRoute(builder: (context) => const HomePage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
