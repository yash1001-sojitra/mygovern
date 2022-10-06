import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mygovern/Core/Constant/string.dart';
import 'dart:math' as math;
import '../../Logic/Widgets/card_for_details.dart';
import '../../Logic/Widgets/drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import '../../Logic/Widgets/pdf_viewer/pdf_viewer_page.dart';

class CatforDoc extends StatelessWidget {
  const CatforDoc({super.key});

  @override
  Widget build(BuildContext context) {
    List catfordoc = [
      "ડોક્યુમેન્ટ પ્રોસેસ",
      "ડોક્યુમેન્ટ સ્ટેપ્સ",
      "ડાઉનલોડ ડોક્યુમેન્ટ"
    ];

    List caticon = ["process.png", "steps.png", "download.png"];
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        title: Text("Details"),
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
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
              if (index == 0) {
                Navigator.pushNamed(context, stepperdetailsScreenRoute);
              } else if (index == 1) {
                Navigator.pushNamed(context, stepperprocessScreenRoute);
              } else if (index == 2) {
                const url = "http://www.africau.edu/images/default/sample.pdf";
                final file = await loadPdfFromNetwork(url);
                openPdf(context, file, url);
              }
            },
            child: Cardfordetails(
              catname: catfordoc[index],
              catimage: "assets/icons/" + caticon[index],
            ),
          );
        },
      ),
    );
  }
}

Future<File> loadPdfFromNetwork(String url) async {
  final response = await http.get(Uri.parse(url));
  final bytes = response.bodyBytes;
  return _storeFile(url, bytes);
}

Future<File> _storeFile(String url, List<int> bytes) async {
  final filename = basename(url);
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/$filename');
  await file.writeAsBytes(bytes, flush: true);
  if (kDebugMode) {
    print('$file');
  }
  return file;
}

//final file = File('example.pdf');
//await file.writeAsBytes(await pdf.save());

void openPdf(BuildContext context, File file, String url) =>
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PdfViewerPage(
          file: file,
          url: url,
        ),
      ),
    );
