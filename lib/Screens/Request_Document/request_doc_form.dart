import 'package:flutter/material.dart';

class RequestDocForm extends StatelessWidget {
  const RequestDocForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () async {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Request Sent Successfully!')));
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Sent Request',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
