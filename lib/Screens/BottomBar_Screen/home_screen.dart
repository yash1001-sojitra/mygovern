// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mygovern/Core/Constant/string.dart';
import 'package:mygovern/Core/Theme/app_theme.dart';
import 'package:mygovern/Logic/Widgets/document_card.dart';
import 'package:mygovern/Logic/Widgets/document_card2.dart';
import 'package:mygovern/Logic/Widgets/document_card3.dart';
import 'package:provider/provider.dart';

import '../../Logic/Modules/add_category_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final categoryList = Provider.of<List<CategoryData>?>(context) ?? [];
    print(categoryList);
    // for (var i = 0; i < categoryList.length; i++) {
    //   print(categoryList[i].categoryname);
    // }

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
            FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                future: FirebaseFirestore.instance
                    .collection('Category')
                    .doc("a74d19ca-2c2f-40ac-b082-9b2c7b6769b4")
                    .collection('Documents')
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Container(
                        color: Colors.transparent,
                        child: Center(
                          child: SizedBox(
                            height: 60,
                            width: 60,
                            child: //CircularProgressIndicator(),
                                Lottie.asset('assets/json/lodingtrans.json'),
                          ),
                        ),
                      ),
                    );
                  }
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, catfordocScreenRoute,
                                arguments: snapshot.data!.docs[index]
                                    ['document']);
                          },
                          child: DocCard1(
                            documentname: snapshot.data!.docs[index]
                                ['document'],
                            documentimage: snapshot.data!.docs[index]
                                ["iconUrl"],
                          ),
                        );
                      },
                    ),
                  );
                }),
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
            categoryList != null
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              categorydetailsScreenRoute,
                              arguments: [
                                categoryList[index].categoryname,
                                categoryList[index].id
                              ],
                            );
                          },
                          child: DocCardforurl(
                            documentname: categoryList[index].categoryname,
                            documentimage: categoryList[index].url,
                          ),
                        );
                      },
                    ),
                  )
                : CircularProgressIndicator(),
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
                itemCount: documentsname.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, catfordocScreenRoute,
                          arguments: documentsname[index]);
                    },
                    child: DocCard2(
                      documentname: documentsname[index],
                      documentimage: "assets/icons/" + documenticon[index],
                    ),
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
