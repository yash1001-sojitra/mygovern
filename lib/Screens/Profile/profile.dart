import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mygovern/Logic/Widgets/decoration.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _nameController = TextEditingController();
  final _dobController = TextEditingController();
  final _passportController = TextEditingController();
  final _aadharController = TextEditingController();
  final _panController = TextEditingController();
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                '* Both details required for request a document',
                style: TextStyle(color: Colors.black54),
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
                          controller: _nameController,
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
                          controller: _dobController,
                          decoration: CustomDecoration.textFormFieldDecoration(
                                  'Date of Birth')
                              .copyWith(
                                  prefixIcon: const Icon(Icons.calendar_month)),
                        ),
                      ),
                      // TODO : Image picker for passport size photo
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                '* Any one documemt details required for request a document',
                style: TextStyle(color: Colors.black54),
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
                          controller: _passportController,
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
                          controller: _aadharController,
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
                          controller: _panController,
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
            InkWell(
              onTap: () async {
                final aadharData = await FirebaseFirestore.instance
                    .collection('Aadharcard')
                    .doc(_aadharController.text)
                    .get();
                final panData = await FirebaseFirestore.instance
                    .collection('Pancard')
                    .doc(_panController.text)
                    .get();
                final passportData = await FirebaseFirestore.instance
                    .collection('Passport')
                    .doc(_passportController.text)
                    .get();
                await FirebaseFirestore.instance
                    .collection('Users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .set({
                  'name': _nameController.text,
                  'dob': _dobController.text,
                  'passport': _passportController.text,
                  'aadhar': _aadharController.text,
                  'pan': _panController.text,
                });
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data Saved Successfully!')));
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
                  'Save',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
