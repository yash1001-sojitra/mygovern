import 'package:flutter/material.dart';
import 'package:mygovern/Core/Constant/string.dart';
import 'package:mygovern/Core/Theme/app_theme.dart';
import 'package:mygovern/Logic/Widgets/document_card.dart';
import 'package:mygovern/Logic/Widgets/document_card2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List documentsname = [
      "આવક પ્રમાણપત્ર",
      "નોન ક્રીમી લેયર પ્રમાણપત્ર",
      "ડોમિસાઇલ સર્ટિફિકેટ",
      "વિધવા સહાય પ્રમાણપત્ર",
      "વારસાઈ પ્રમાણપત્ર"
    ];

    List categorys = [
      "નાગરિક સેવાઓ",
      "રેશન કાર્ડ",
      "આવક(Revenue)/ જમીન",
      "મેજિસ્ટ્રિયલ",
      "અન્ય"
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, viewalldocScreenRoute);
                    },
                    child: const Text("View All",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.purple)),
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
                      Navigator.pushNamed(context, stepperdetailsScreenRoute);
                    },
                    child: DocCard1(
                      documentname: documentsname[index],
                      documentimage: "assets/images/Mygov.png",
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
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, categorydetailsScreenRoute);
                    },
                    child: DocCard2(
                      documentname: categorys[index],
                      documentimage: "assets/images/Mygov.png",
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, viewalldocScreenRoute);
                    },
                    child: const Text("View All",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.purple)),
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
                    documentimage: "assets/images/Mygov.png",
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
