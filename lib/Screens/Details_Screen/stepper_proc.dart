import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mygovern/Logic/Widgets/stepper.dart';
import 'dart:math' as math;

import '../../Logic/Widgets/drawer.dart';

class StepperPross extends StatefulWidget {
  const StepperPross({super.key});

  @override
  State<StepperPross> createState() => _StepperProssState();
}

class _StepperProssState extends State<StepperPross> {
  List documentdetails = [
    "મામલતદાર/તલાટી/જનસેવા કેન્દ્ર કચેરીમાંથી અરજીપત્રક અને ટિકિટો એકત્રિત કરો.",
    "ફોર્મ ભરો અને મંજૂરી માટે જરૂરી દસ્તાવેજો જોડો.",
    "જો તમારી પાસે કાસ્ટ સર્ટિફિકેટ ન હોય તો એફિડેવિટ મેળવો.",
    "જો ફોર્મમાં પંચનામુની આવશ્યકતા હોય તો ચકાસણી માટે બે લોકોને સંબંધિત ",
    "ફોર્મ સબમિટ કરવા માટે સીધા જ સંબંધિત ઓફિસ પર જાઓ.",
    "ઓફિસમાં ફોર્મ સબમિટ કરો.",
    "માન્ય દસ્તાવેજો એકત્રિત કરો.",
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
        title: const Text("ડોક્યુમેન્ટ સ્ટેપ્સ"),
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
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: Color(0xff1a1a1a)),
        ),
      ),
      drawer: const Drawerbtn(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: documentdetails.length,
          itemBuilder: (BuildContext context, int index) {
            return Steppercard(
              processname: documentdetails[index],
              index: index + 1,
              size: documentdetails.length,
              color: Color(int.parse(colors[Random().nextInt(colors.length)])),
            );
          },
        ),
      ),
    );
  }
}
