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
  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Steppercard(),
            Steppercard(),
            Steppercard(),
            Steppercard(),
            Steppercard(),
          ],
        ),
      ),
    );
  }
}
