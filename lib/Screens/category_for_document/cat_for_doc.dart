import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mygovern/Core/Constant/string.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;
import '../../Logic/Widgets/card_for_details.dart';
import '../../Logic/Widgets/drawer.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import '../../Logic/Widgets/pdf_viewer/pdf_viewer_page.dart';

class CatforDoc extends StatefulWidget {
  String documentname;

  CatforDoc({required this.documentname, super.key});

  @override
  State<CatforDoc> createState() => _CatforDocState();
}

class _CatforDocState extends State<CatforDoc> {
  @override
  Widget build(BuildContext context) {
    List catfordoc = [
      "ડોક્યુમેન્ટ પ્રોસેસ",
      "ડોક્યુમેન્ટ સ્ટેપ્સ",
      "ડાઉનલોડ ડોક્યુમેન્ટ",
      "ફોર્મ ભરો",
      "ડોક્યુમેન્ટ રીક્વેસ્ટ",
      "ડોક્યુમેન્ટ ટ્યુટોરીયલ",
    ];

    List documenturl = [
      "https://www.digitalgujarat.gov.in/DownLoad/pdfforms/s63.pdf",
      "https://www.digitalgujarat.gov.in/DownLoad/pdfforms/s76.pdf",
    ];
    List caticon = [
      "process.png",
      "steps.png",
      "download.png",
      "formfill.png",
      "request.png",
      "tutorial.png"
    ];
    List docname = [
      "આવક પ્રમાણપત્ર",
      "ડોમિસાઇલ સર્ટિફિકેટ ",
      "નોન ક્રીમી લેયર પ્રમાણપત્ર",
      "વારસાઈ પ્રમાણપત્ર",
      "વિધવા સહાય પ્રમાણપત્ર"
    ];
    List urls = [
      "https://www.youtube.com/watch?v=eejTnqQ5EWg",
      "https://www.youtube.com/watch?v=hm-JXHsp9vs",
      "https://www.youtube.com/watch?v=V5-tbZf0lOM",
      "https://www.youtube.com/watch?v=i_w9-lGIaR0",
      "https://www.youtube.com/watch?v=YAG_1EyaeOE"
    ];
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        title: Flexible(
            child: Text(
          docname[0] == widget.documentname
              ? docname[0]
              : docname[1] == widget.documentname
                  ? docname[1]
                  : docname[2] == widget.documentname
                      ? docname[2]
                      : docname[3] == widget.documentname
                          ? docname[3]
                          : docname[4] == widget.documentname
                              ? docname[4]
                              : docname[0],
          softWrap: true,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )),
        // Text(widget.documentname),
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
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
              if (index == 0) {
                Navigator.pushNamed(context, stepperdetailsScreenRoute);
              } else if (index == 1) {
                Navigator.pushNamed(context, stepperprocessScreenRoute);
              } else if (index == 2) {
                const url =
                    "https://www.digitalgujarat.gov.in/DownLoad/pdfforms/s63.pdf";
                final file = await loadPdfFromNetwork(url);
                openPdf(context, file, url);
              } else if (index == 3) {
                Navigator.pushNamed(context, invoiceScreenRoute);
              } else if (index == 4) {
                Navigator.pushNamed(context, requestDocListScreenRoute);
              } else {
                _launchURL(docname[0] == widget.documentname
                    ? urls[0]
                    : docname[1] == widget.documentname
                        ? urls[1]
                        : docname[2] == widget.documentname
                            ? urls[2]
                            : docname[3] == widget.documentname
                                ? urls[3]
                                : docname[4] == widget.documentname
                                    ? urls[4]
                                    : urls[0]);
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

_launchURL(String link) async {
  final url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
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
