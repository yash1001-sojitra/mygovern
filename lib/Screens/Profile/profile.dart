import 'package:flutter/material.dart';
import 'package:mygovern/Logic/Widgets/decoration.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                'Basic Details',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration:
                            CustomDecoration.containerCornerRadiusDecoration,
                        child: TextFormField(
                          decoration: CustomDecoration.textFormFieldDecoration(
                                  'Full name')
                              .copyWith(prefixIcon: const Icon(Icons.person)),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Note : Enter name as per valid document',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration:
                            CustomDecoration.containerCornerRadiusDecoration,
                        child: TextFormField(
                          decoration: CustomDecoration.textFormFieldDecoration(
                                  'Date of Birth')
                              .copyWith(
                                  prefixIcon: const Icon(Icons.calendar_month)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                'Document Details',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration:
                            CustomDecoration.containerCornerRadiusDecoration,
                        child: TextFormField(
                          decoration: CustomDecoration.textFormFieldDecoration(
                                  'Passport number')
                              .copyWith(
                                  prefixIcon:
                                      const Icon(Icons.numbers_rounded)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration:
                            CustomDecoration.containerCornerRadiusDecoration,
                        child: TextFormField(
                          decoration: CustomDecoration.textFormFieldDecoration(
                                  'Aadhar card number')
                              .copyWith(
                                  prefixIcon:
                                      const Icon(Icons.numbers_rounded)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration:
                            CustomDecoration.containerCornerRadiusDecoration,
                        child: TextFormField(
                          decoration: CustomDecoration.textFormFieldDecoration(
                                  'Pan card number')
                              .copyWith(
                                  prefixIcon:
                                      const Icon(Icons.numbers_rounded)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Save',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
