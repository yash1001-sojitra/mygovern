import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mygovern/Core/Constant/string.dart';
import 'dart:math' as math;
import '../../Logic/Widgets/card_for_details.dart';
import '../../Logic/Widgets/drawer.dart';

class CatforDoc extends StatelessWidget {
  const CatforDoc({super.key});

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
                onPressed: () async {});
          }),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: Color(0xff1a1a1a)),
        ),
      ),
      drawer: const Drawerbtn(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              if (index == 0) {
                Navigator.pushNamed(context, stepperdetailsScreenRoute);
              } else if (index == 1) {
                Navigator.pushNamed(context, stepperprocessScreenRoute);
              }
            },
            child: Cardfordetails(
              catname: "Download Document",
              catimage: "assets/icons/pdf.png",
            ),
          );
        },
      ),
    );
  }
}
