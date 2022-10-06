import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:mygovern/Logic/Widgets/pdf_download.dart';
import 'package:mygovern/Logic/Widgets/stepper.dart';
import 'dart:math' as math;
import '../../Logic/Widgets/drawer.dart';

class DocStepperView extends StatefulWidget {
  const DocStepperView({super.key});

  @override
  State<DocStepperView> createState() => _DocStepperViewState();
}

class _DocStepperViewState extends State<DocStepperView> {
  int _activeCurrentStep = 0;
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
  final textstyle = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
  List<Step> stepList() => [
        Step(
          state:
              _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 0,
          title: Text(
            documentdetails[0],
            style: textstyle,
          ),
          content: Center(
              child: Column(
            children: [
              Image.asset("assets/images/familymamber.jpeg"),
              TextButton(
                  onPressed: () async {
                    try {
                      var imageId = await ImageDownloader.downloadImage(
                          "assets/images/familymamber.jpeg");
                      if (imageId == null) {
                        return print("Image download faild");
                      }
                    } on PlatformException catch (error) {
                      print(error);
                    }
                  },
                  child: Text("Click here to Download"))
            ],
          )),
        ),
        Step(
          state:
              _activeCurrentStep <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 0,
          title: Text(
            documentdetails[1],
            style: textstyle,
          ),
          content: Center(
              child: Column(
            children: [
              Image.asset("assets/images/secondimage.jpeg"),
              TextButton(
                  onPressed: () async {
                    try {
                      var imageId = await ImageDownloader.downloadImage(
                          "assets/images/secondimage.jpeg");
                      if (imageId == null) {
                        return print("Image download faild");
                      }
                    } on PlatformException catch (error) {
                      print(error);
                    }
                  },
                  child: Text("Click here to Download"))
            ],
          )),
        ),
        Step(
            state: _activeCurrentStep <= 2
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 0,
            title: Text(
              documentdetails[2],
              style: textstyle,
            ),
            content: Center(
                child: Column(
              children: [
                // Image.asset("assets/images/panchnamu.png"),

                TextButton(
                    onPressed: () async {
                      try {
                        var imageId = await ImageDownloader.downloadImage(
                            "assets/images/panchnamu.png");
                        if (imageId == null) {
                          return print("Image download faild");
                        }
                      } on PlatformException catch (error) {
                        print(error);
                      }
                    },
                    child: Pdf_demo_card())
              ],
            ))),
        Step(
            state: _activeCurrentStep <= 3
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 0,
            title: Text(
              documentdetails[3],
              style: textstyle,
            ),
            content: Center(
              child: Text(
                documentdetails[3],
                style: textstyle,
              ),
            )),
        Step(
          state:
              _activeCurrentStep <= 4 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 0,
          title: Text(
            documentdetails[4],
            style: textstyle,
          ),
          content: Center(
              child: Column(
            children: [
              Image.asset("assets/images/resancard.jpg"),
              TextButton(
                  onPressed: () async {
                    try {
                      var imageId = await ImageDownloader.downloadImage(
                          "assets/images/resancard.jpg");
                      if (imageId == null) {
                        return print("Image download faild");
                      }
                    } on PlatformException catch (error) {
                      print(error);
                    }
                  },
                  child: Text("Click here to Download"))
            ],
          )),
        ),
        Step(
            state: _activeCurrentStep <= 5
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 0,
            title: Text(
              documentdetails[5],
              style: textstyle,
            ),
            content: Center(
              child: Text(
                documentdetails[5],
                style: textstyle,
              ),
            )),
        Step(
          state:
              _activeCurrentStep <= 6 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 0,
          title: Text(
            documentdetails[6],
            style: textstyle,
          ),
          content: Center(
              child: Column(
            children: [
              Image.asset("assets/images/lightbill.jpeg"),
              TextButton(
                  onPressed: () async {
                    try {
                      var imageId = await ImageDownloader.downloadImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw9AD7GKXlRpxHn-Tej5GsoBxCGo3H4fh8DJ-7rKIJ&s");
                      if (imageId == null) {
                        return print("Image download faild");
                      }
                    } on PlatformException catch (error) {
                      print(error);
                    }
                  },
                  child: Text("Click here to Download"))
            ],
          )),
        ),
        Step(
            state: _activeCurrentStep <= 7
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 0,
            title: Text(
              documentdetails[7],
              style: textstyle,
            ),
            content: Center(
              child: Text(
                documentdetails[7],
                style: textstyle,
              ),
            )),
        Step(
            state: _activeCurrentStep <= 8
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 0,
            title: Text(
              documentdetails[8],
              style: textstyle,
            ),
            content: Center(
              child: Text(
                documentdetails[8],
                style: textstyle,
              ),
            )),
        Step(
          state: StepState.complete,
          isActive: _activeCurrentStep >= 9,
          title: Text(
            documentdetails[9],
            style: textstyle,
          ),
          content: Center(
              child: Text(
            documentdetails[9],
            style: textstyle,
          )),
        )
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        title: Text("Document Process"),
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
                  "assets/icons/bookmark.svg",
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
      body: Stepper(
        currentStep: _activeCurrentStep,
        steps: stepList(),
        // onStepContinue takes us to the next step
        onStepContinue: () {
          if (_activeCurrentStep < (stepList().length - 1)) {
            setState(() {
              _activeCurrentStep += 1;
            });
          }
        },

        // onStepCancel takes us to the previous step
        onStepCancel: () {
          if (_activeCurrentStep == 0) {
            return;
          }

          setState(() {
            _activeCurrentStep -= 1;
          });
        },

        // onStepTap allows to directly click on the particular step we want
        onStepTapped: (int index) {
          setState(() {
            _activeCurrentStep = index;
          });
        },
      ),
    );
  }
}
