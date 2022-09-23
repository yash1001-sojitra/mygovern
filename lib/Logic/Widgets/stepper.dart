import 'package:flutter/material.dart';

class Steppercard extends StatelessWidget {
  const Steppercard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 16,
                child: Text("1"),
              ),
              SizedBox(
                width: 20,
              ),
              Text("Enter Data Here")
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
              height: 20,
              width: 30,
              child: VerticalDivider(
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
