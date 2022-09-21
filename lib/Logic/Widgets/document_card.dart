import 'package:flutter/material.dart';

class DocCard1 extends StatelessWidget {
  String documentname;
  String documentimage;
  DocCard1(
      {required this.documentname, required this.documentimage, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey.withOpacity(0.4))),
        child: SizedBox(
          width: 200,
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10), border: Border.all()),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  documentimage,
                  height: 45,
                  width: 60,
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                    child: Text(documentname,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
