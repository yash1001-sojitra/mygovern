import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mygovern/Logic/Services/firestore/category_firestore_services.dart';
import 'package:mygovern/Logic/Services/firestore/documentdata_firestore_services.dart';
import 'package:mygovern/Routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  int? initScreen;
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      StreamProvider.value(
        value: CategoryDataFirestoreService().getCategoryData(),
        initialData: null,
      ),
      // StreamProvider.value(
      //   value: DocumentDataFirestoreService().getDocumentData(),
      //   initialData: null,
      // ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // localizationsDelegates: [

      // ],
      // supportedLocales: [
      //   Locale('gu', 'IN'),
      // ],
      // theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
