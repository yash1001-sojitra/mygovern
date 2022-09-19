import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mygovern/Logic/Widgets/document_card2.dart';
import 'dart:math' as math;
import '../../Logic/Widgets/drawer.dart';
import '../Home_Screen/homepage.dart';

class ViewAllDoc extends StatefulWidget {
  const ViewAllDoc({super.key});

  @override
  State<ViewAllDoc> createState() => _ViewAllDocState();
}

class _ViewAllDocState extends State<ViewAllDoc> {
  @override
  Widget build(BuildContext context) {
    List documentsname = [
      "આવક પ્રમાણપત્ર",
      "નોન ક્રીમી લેયર પ્રમાણપત્ર",
      "ડોમિસાઇલ સર્ટિફિકેટ",
      "વિધવા સહાય પ્રમાણપત્ર",
      "વારસાઈ પ્રમાણપત્ર",
      "અનુસુચિત જાતિ/અનુસુચિત જનજાતિ માટેનું પ્રમાણપત્ર",
      "ધાર્મિક અને ભાષાકીય લઘુમતી પ્રમાણપત્ર",
      "સામાજીક અને શૈક્ષણિક રીતે પછાત વર્ગનું પ્રમાણપત્ર",
      "આર્થિક રીતે નબળા વર્ગના (EWS) અનામતનું  પ્રમાણપત્ર",
      "બીનઅનામત વર્ગનું જાતિનું પ્રમાણપત્ર",
      "સોગંદનામું (એફીડેવીટ)",
      "વિધવા હોવા અંગેનું તથા આવકનું પ્રમાણપત્ર",
      "સોલવન્સી સર્ટીફીકેટ",
      "રક્ષણ માટેના પરવાનો રીન્યુ કરવા બાબત",
    ];
    List doc2 = [
      "નવું રેશન કાર્ડ મેળવવા",
      "અલગ રેશન કાર્ડ મેળવવા ",
      "ડુપ્લીકેટ રેશન કાર્ડ મેળવવા",
      "રેશન કાર્ડમાં નામ દાખલ",
      "રેશન કાર્ડમાંથી નામ કમી કરવા",
      "રેશન કાર્ડમાં સરનામું ફેરફાર કરવા",
      "સ્થળાંતર કરવાને કારણે રેશનકાર્ડમાં કમી કર્યાની નોંધ કરવા",
      "નવી પંડીત દીનદયાલ ગ્રાહક ભંડાર (વ્યાજબી ભાવની સરકાર માન્ય દુકાન) મંજુર કરવા"
    ];
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "નાગરિક સેવાઓ",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Divider(),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8, crossAxisCount: 3),
              itemCount: documentsname.length,
              physics: NeverScrollableScrollPhysics(),
              // padding: EdgeInsets.all(10),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return DocCard2(
                    documentname: documentsname[index],
                    documentimage: "assets/images/Mygov.png");
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "રેશન કાર્ડ",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.6, crossAxisCount: 3),
                itemCount: doc2.length,
                // padding: EdgeInsets.all(10),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return DocCard2(
                      documentname: doc2[index],
                      documentimage: "assets/images/Mygov.png");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
