import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Logic/Widgets/bookmark_card.dart';
import '../category_for_document/cat_for_doc.dart';

class RecentScreen extends StatefulWidget {
  const RecentScreen({super.key});

  @override
  State<RecentScreen> createState() => _RecentScreenState();
}

class _RecentScreenState extends State<RecentScreen> {
  int data = 0;
  List bookmarkicon = [
    "ayushman.png",
    "voter.png",
    "passport.png",
    "aadhaar.png",
    "pancard.png",
    "lic.png",
    "rationcard.png",
  ];

  List bookmarkname = [
    "આયુષ્માન કાર્ડ",
    "મતદાર કાર્ડ",
    "પાસપોર્ટ",
    "આધાર કાર્ડ",
    "પાન કાર્ડ",
    "એલ આઇ સી વીમા",
    "રેશન કાર્ડ",
  ];

  List subtitle = [
    "તબીબી તપાસ, સારવાર અને કન્સલ્ટેશન ફી માટે કવરેજ પૂરું પાડે ",
    "ચૂંટણી પંચ દ્વારા જારી કરાયેલ ઓળખ દસ્તાવેજ",
    "દેશની નાગરિકતા",
    "અનન્ય ઓળખ સત્તા",
    "આવક ટેક્સ વિભાગ",
    "જીવન વીમા યોજના",
    "કાનૂની ઓળખ પુરાવો",
  ];
  @override
  Widget build(BuildContext context) {
    return data == 1
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Container(
              child: Lottie.asset("assets/json/nodatafound.json"),
            )),
          )
        : ListView.builder(
            itemCount: bookmarkname.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CatforDoc(
                        id: bookmarkname[index],
                        documentname: bookmarkname[index],
                      ),
                      settings: RouteSettings(
                        arguments: bookmarkname[index],
                      ),
                    ),
                  );
                },
                child: BookmarkCard(
                  documentname: bookmarkname[index],
                  documentimage: "assets/icons/" + bookmarkicon[index],
                  documentsubtitle: subtitle[index],
                ),
              );
            },
          );
  }
}
