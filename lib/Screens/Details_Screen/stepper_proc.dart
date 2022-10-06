import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mygovern/Logic/Widgets/stepper.dart';
import 'dart:math' as math;

import '../../Logic/Widgets/drawer.dart';
import '../Home_Screen/homepage.dart';

class StepperPross extends StatefulWidget {
  const StepperPross({super.key});

  @override
  State<StepperPross> createState() => _StepperProssState();
}

class _StepperProssState extends State<StepperPross> {
  List documentdetails = [
    "કુટુંબના સભ્યોની વિગતો દર્શાવતું પત્રક",
    "અરજદારનો તલાટી સમક્ષ રૂબરૂ જવાબ",
    "પંચનામું",
    "રહેઠાણ અંગેનું પુરાવો",
    "રેશનકાર્ડ",
    "છેલ્લા માસનું ટેલીફોન બીલ–લેન્ડલાઈન સહિત મોબાઈલ ફોનનાં બીલોની વિગત આપવી",
    "છેલ્લા માસનું લાઈટ બીલ",
    "નોકરી કરતાં હોયતો આવકનો પુરાવો",
    "ધંધો/વ્યવસાયના પુરાવા",
    "ધંધો/વ્યવસાયના આવકના છેલ્લા વર્ષના સરવૈયાની નકલ તથા ઇન્કમટેક્ષની નકલ"
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
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        title: Text("Document Steps"),
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
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListView.builder(
            itemCount: documentdetails.length,
            itemBuilder: (BuildContext context, int index) {
              return Steppercard(
                processname: documentdetails[index],
                index: index + 1,
                size: documentdetails.length,
                color:
                    Color(int.parse(colors[Random().nextInt(colors.length)])),
              );
            },
          ),
        ),
      ),
    );
  }
}
