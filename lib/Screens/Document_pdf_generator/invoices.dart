import 'package:flutter/material.dart';
import 'package:mygovern/Logic/Widgets/bookmark_card.dart';
import 'package:mygovern/Screens/Document_pdf_generator/pdfexport/pdfpreview.dart';

import 'model/invoice.dart';

class InvoicePage extends StatelessWidget {
  InvoicePage({Key? key}) : super(key: key);

  final requireddata = <requireddataforpdf>[
    requireddataforpdf(
        dateofbirth: "10-01-2002",
        address: "107 સ્વામિનારાયણ નગર સિમડા ગામ, સુરત",
        phonenumber: "7359543703",
        name: "યશકુમાર રાંક",
        documentname: "આધાર કાર્ડ",
        date: "08-10-2022",
        familymambercount: 5,
        getincome: 4,
        income: 140000,
        lightbill: 1500,
        place: "Surat"),
    requireddataforpdf(
        dateofbirth: "10-01-2002",
        address: "શેરી નં. 4, મારુતિનગર, ઘોઘા રોડ, ભાવનગર",
        phonenumber: "7359543703",
        name: "સિંધા વિપેન્દ્રાસિંહ",
        documentname: "આધાર કાર્ડ",
        date: "08-10-2022",
        familymambercount: 5,
        getincome: 4,
        income: 140000,
        lightbill: 1500,
        place: "Surat"),
    requireddataforpdf(
        dateofbirth: "10-01-2002",
        address: "શેરી નં. 4, મારુતિનગર, ઘોઘા રોડ, ભાવનગર",
        phonenumber: "7359543703",
        name: "મેહુલ રામ",
        documentname: "આધાર કાર્ડ",
        date: "08-10-2022",
        familymambercount: 5,
        getincome: 4,
        income: 140000,
        lightbill: 1500,
        place: "Surat"),
    requireddataforpdf(
        dateofbirth: "10-01-2002",
        address: "107 surat gujarat india",
        phonenumber: "7359543703",
        name: "ધવલ તરસરિયા",
        documentname: "આધાર કાર્ડ",
        date: "08-10-2022",
        familymambercount: 5,
        getincome: 4,
        income: 140000,
        lightbill: 1500,
        place: "Surat"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Document'),
      ),
      body: ListView(
        children: [
          ...requireddata.map((e) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (builder) => PdfPreviewPage(invoice: e),
                    ),
                  );
                },
                child: BookmarkCard(
                    documentname: e.name,
                    documentsubtitle: e.documentname,
                    documentimage: "assets/icons/aadhaar.png"),
              ))
        ],
      ),
    );
  }
}
