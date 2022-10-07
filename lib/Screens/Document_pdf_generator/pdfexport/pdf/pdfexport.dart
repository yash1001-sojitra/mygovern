import 'dart:typed_data';

import 'package:mygovern/Core/Constant/string.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

import '../../model/invoice.dart';

Future<Uint8List> makePdf(requireddataforpdf invoice) async {
  final pdf = Document();
  final gujaratifont = Font.ttf(await rootBundle.load("assets/fonts/Anek.ttf"));
  final imageLogo = MemoryImage(
      (await rootBundle.load('assets/images/aadhaarforpdf.png'))
          .buffer
          .asUint8List());
  pdf.addPage(
    Page(
      theme: ThemeData.withFont(base: gujaratifont),
      build: (context) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "${invoice.documentname}",
                    ),
                    Text(
                      invoice.address,
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image(imageLogo),
                )
              ],
            ),
            Container(height: 50),
            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                "107 સ્વામિનારાયણ નગર સિમડા ગામ, સુરત ${invoice.address}",
                style: Theme.of(context).header3.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    ),
  );
  return pdf.save();
}

Widget PaddedText(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: align,
      ),
    );
