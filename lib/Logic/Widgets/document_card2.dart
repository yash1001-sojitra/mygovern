import 'package:flutter/material.dart';
import 'package:mygovern/Core/Theme/app_theme.dart';

class DocCard2 extends StatelessWidget {
  String documentname;
  String documentimage;
  DocCard2(
      {required this.documentname, required this.documentimage, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(50)),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 45,
                child: Image.asset(
                  documentimage,
                  height: 60,
                  width: 60,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Text(documentname,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 93, 23, 105)))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
