import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.only(top: 10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return DocCard2(
                documentname: "Aadhar card",
                documentimage: "assets/images/Mygov.png");
          },
        ),
      ),
    );
  }
}
