import 'package:flutter/material.dart';
import 'package:mygovern/Logic/Widgets/bookmark_card.dart';

import '../category_for_document/cat_for_doc.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List bookmarkicon = [
      "aadhaar.png",
      "pancard.png",
      "lic.png",
      "rationcard.png",
      "ayushman.png",
      "voter.png",
      "passport.png",
    ];

    List bookmarkname = [
      "આધાર કાર્ડ",
      "પાન કાર્ડ",
      "એલ આઇ સી વીમા",
      "રેશન કાર્ડ",
      "આયુષ્માન કાર્ડ",
      "મતદાર કાર્ડ",
      "પાસપોર્ટ"
    ];

    List subtitle = [
      "અનન્ય ઓળખ સત્તા",
      "આવક ટેક્સ વિભાગ",
      "જીવન વીમા યોજના",
      "કાનૂની ઓળખ પુરાવો",
      "તબીબી તપાસ, સારવાર અને કન્સલ્ટેશન ફી માટે કવરેજ પૂરું પાડે ",
      "ચૂંટણી પંચ દ્વારા જારી કરાયેલ ઓળખ દસ્તાવેજ",
      "દેશની નાગરિકતા"
    ];

    return ListView.builder(
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
