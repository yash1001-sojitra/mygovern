import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mygovern/Logic/Widgets/document_card3.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../../Logic/Modules/add_category_model.dart';
import '../../Logic/Widgets/document_card2.dart';
import '../../Logic/Widgets/drawer.dart';
import '../Home_Screen/homepage.dart';

class CategoryDetails extends StatefulWidget {
  String categoryname;
  CategoryDetails({required this.categoryname, super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List documentsname = [
    "નવું રેશન કાર્ડ મેળવવા",
    "અલગ રેશન કાર્ડ મેળવવા ",
    "ડુપ્લીકેટ રેશન કાર્ડ મેળવવા",
    "રેશન કાર્ડમાં નામ દાખલ",
    "રેશન કાર્ડમાંથી નામ કમી કરવા",
    "રેશન કાર્ડમાં સરનામું ફેરફાર કરવા",
    "સ્થળાંતર કરવાને કારણે રેશનકાર્ડમાં કમી કર્યાની નોંધ કરવા",
    "નવી પંડીત દીનદયાલ ગ્રાહક ભંડાર (વ્યાજબી ભાવની સરકાર માન્ય દુકાન) મંજુર કરવા"
  ];

  List colors = [
    "0xffCD5C5C",
    "0xffDFFF00",
    "0xff40E0D0",
    "0xff6495ED",
    "0xffDE3163",
    "0xffFFBF00",
    "0xff008000",
    "0xff800080",
    "0xff808080",
  ];
  @override
  Widget build(BuildContext context) {
    final categoryList = Provider.of<List<CategoryData>?>(context);
    for (var i = 0; i < categoryList!.length; i++) {
      print(categoryList[i].categoryname);
    }
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        title: Flexible(
            child: Text(
          widget.categoryname,
          softWrap: true,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )),
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) {
            return IconButton(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: SvgPicture.asset(
                    "assets/icons/drawer.svg",
                    height: 30,
                    width: 35,
                    color: Colors.white,
                  ),
                ));
          },
        ),
        elevation: 0,
        actions: [
          Builder(builder: (context) {
            return IconButton(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: SvgPicture.asset(
                  "assets/icons/search.svg",
                  height: 22,
                  width: 30,
                  color: Colors.white,
                ),
                onPressed: () async {
                  var result = await showSearch<String>(
                    context: context,
                    delegate: CustomDelegate(),
                  );
                  setState(() => result = result);
                });
          }),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: Color(0xff1a1a1a)),
        ),
      ),
      drawer: const Drawerbtn(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.8, crossAxisCount: 3),
          itemCount: documentsname.length,
          // padding: EdgeInsets.all(10),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return DocCard3(
                documentname: documentsname[index],
                documentimage: "assets/icons/national.png",
                color:
                    Color(int.parse(colors[Random().nextInt(colors.length)])));
          },
        ),
      ),
    );
  }
}
