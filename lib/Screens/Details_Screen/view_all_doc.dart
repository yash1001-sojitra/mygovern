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
    List documentsname = [
      "આવક પ્રમાણપત્ર",
      "નોન ક્રીમી લેયર પ્રમાણપત્ર",
      "ડોમિસાઇલ સર્ટિફિકેટ",
      "વિધવા સહાય પ્રમાણપત્ર",
      "વારસાઈ પ્રમાણપત્ર"
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
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.8, crossAxisCount: 3),
          itemCount: documentsname.length,
          // padding: EdgeInsets.all(10),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return DocCard2(
                documentname: documentsname[index],
                documentimage: "assets/images/Mygov.png");
          },
        ),
      ),
    );
  }
}

// class DocCard3 extends StatelessWidget {
//   String documentname;
//   String documentimage;
//   DocCard3(
//       {required this.documentname, required this.documentimage, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 130,
//       height: 200,
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey.withOpacity(0.4)),
//                   borderRadius: BorderRadius.circular(50)),
//               child: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 radius: 40,
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 8.0, left: 10),
//                   child: Image.asset(
//                     documentimage,
//                     height: 60,
//                     width: 60,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Flexible(
//                     child: Text(documentname,
//                         softWrap: true,
//                         maxLines: 2,
//                         overflow: TextOverflow.clip,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w900,
//                             color: Color.fromARGB(255, 93, 23, 105)))),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
