// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:mygovern/Core/Constant/string.dart';
import 'package:mygovern/Core/Theme/app_theme.dart';
import 'package:mygovern/Logic/Widgets/document_card.dart';
import 'package:mygovern/Logic/Widgets/document_card2.dart';
import 'package:mygovern/Screens/Details_Screen/category_details.dart';
import 'package:provider/provider.dart';

import '../../Logic/Modules/add_category_model.dart';
import '../category_for_document/cat_for_doc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final categoryList = Provider.of<List<CategoryData>?>(context);
    for (var i = 0; i < categoryList!.length; i++) {
      print(categoryList[i].id);
    }

    List documentsname = [
      "આવક પ્રમાણપત્ર",
      "નોન ક્રિમિલિયર પ્રમાણપત્ર",
      "ડોમિસાઇલ સર્ટિફિકેટ",
      "વિધવા સહાય પ્રમાણપત્ર",
      "વારસાઈ પ્રમાણપત્ર"
    ];

    List documenticon = [
      "national.png",
      "national.png",
      "national.png",
      "national.png",
      "national.png"
    ];

    List categorys = [
      "નાગરિક સેવાઓ",
      "રેશન કાર્ડ",
      "આવક(Revenue)/ જમીન",
      "મેજિસ્ટ્રિયલ",
      "અન્ય"
    ];

    List categoryicon = [
      "nagrikta.png",
      "rationcard.png",
      "incom.png",
      "majistralier.png",
      "other.png"
    ];
    return SingleChildScrollView(
      child: Container(
        // width: MediaQuery.of(context).size.width,
        color: AppTheme.lightTheme.scaffoldBackgroundColor,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Related Documents",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, viewalldocScreenRoute);
                    },
                    child: const Text("View All",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54)),
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, catfordocScreenRoute,
                          arguments: documentsname[index]);
                    },
                    child: DocCard1(
                      documentname: documentsname[index],
                      documentimage: "assets/icons/" + documenticon[index],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Categorys",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categorys.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, categorydetailsScreenRoute,
                          arguments: categorys[index]);
                    },
                    child: DocCard2(
                      documentname: categorys[index],
                      documentimage: "assets/icons/" + categoryicon[index],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Download Documents",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, viewalldocScreenRoute);
                    },
                    child: const Text("View All",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54)),
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return DocCard2(
                    documentname: documentsname[index],
                    documentimage: "assets/icons/" + documenticon[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
