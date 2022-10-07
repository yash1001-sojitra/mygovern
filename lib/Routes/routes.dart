// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:mygovern/Core/Constant/string.dart';
import 'package:mygovern/Screens/Details_Screen/category_details.dart';
import 'package:mygovern/Screens/Details_Screen/detailspage.dart';
import 'package:mygovern/Screens/Details_Screen/stepper_proc.dart';
import 'package:mygovern/Screens/Details_Screen/view_all_doc.dart';
import 'package:mygovern/Screens/Home_Screen/homepage.dart';
import 'package:mygovern/Screens/Request_Document/request_doc_list.dart';
import 'package:mygovern/Screens/category_for_document/cat_for_doc.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

      // case onboardingScreenRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => const OnboardingScreen());

      // main screens
      case homepageScreenRoute:
        return MaterialPageRoute(builder: (context) => const HomePage());

      // details screens
      case viewalldocScreenRoute:
        return MaterialPageRoute(builder: (context) => const ViewAllDoc());

      case stepperdetailsScreenRoute:
        return MaterialPageRoute(builder: (context) => const DocStepperView());

      case categorydetailsScreenRoute:
        return MaterialPageRoute(
            builder: (context) => CategoryDetails(
                  data: args,
                ));
      case catfordocScreenRoute:
        return MaterialPageRoute(
            builder: (context) => CatforDoc(
                  documentname: args,
                ));

      case stepperprocessScreenRoute:
        return MaterialPageRoute(builder: (context) => const StepperPross());

      case requestDocListScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const RequestDocumentList());
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
