import 'package:flutter/material.dart';
import 'package:mygovern/Logic/Widgets/bookmark_card.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return BookmarkCard(
          documentname: "Aadhar Card Aadhar Card fgadfgsdfg ",
          documentimage: "assets/images/Mygov.png",
          documentsubtitle: "this is subtitle",
        );
      },
    );
  }
}
