import 'package:flutter/material.dart';
import 'package:mygovern/Logic/Widgets/bookmark_card.dart';

class RequestDocumentList extends StatelessWidget {
  const RequestDocumentList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> docs = ['Aadharcard', 'Pancard', 'Rationcard'];
    List docIcon = [
      "aadhaar.png",
      "pancard.png",
      "rationcard.png",
    ];
    List subtitle = [
      "અનન્ય ઓળખ સત્તા",
      "આવક ટેક્સ વિભાગ",
      "કાનૂની ઓળખ પુરાવો",
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('ડોક્યુમેન્ટ રીક્વેસ્ટ'),
      ),
      body: ListView.builder(
        itemCount: docs.length,
        itemBuilder: (ctx, index) {
          return BookmarkCard(
              documentname: docs[index],
              documentsubtitle: subtitle[index],
              documentimage: "assets/icons/" + docIcon[index]);
        },
      ),
    );
  }
}
