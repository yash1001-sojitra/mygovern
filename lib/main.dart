import 'package:flutter/material.dart';
import 'package:mygovern/Core/Theme/app_theme.dart';
import 'package:mygovern/Routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt("initScreen", 1);
  // await Firebase.initializeApp();

  runApp(const MyApp()
      //   MultiProvider(
      //   providers: [],
      //   child: const MyApp(),
      // )
      );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
