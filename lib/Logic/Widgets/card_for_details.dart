import 'package:flutter/material.dart';

class Cardfordetails extends StatelessWidget {
  String catname;
  String catimage;
  Cardfordetails({required this.catname, required this.catimage, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 40,
        width: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 35,
              child: Image.asset(
                catimage,
                height: 40,
                width: 40,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Text(catname,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
