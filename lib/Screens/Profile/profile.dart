import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  late File imageFile;
  PlatformFile? pickedFile;
  bool showLoading = false;

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
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: FirebaseFirestore.instance
              .collection('Users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final data = snapshot.data!;
            _nameController.text = data.get('name');
            _dobController.text = data.get('dob');
            _passportController.text = data.get('passport');
            _aadharController.text = data.get('aadhar');
            _panController.text = data.get('pan');

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          height: 160,
                          decoration:
                              CustomDecoration.containerCornerRadiusDecoration,
                          child: pickedFile != null
                              ? Image.file(
                                  (File("${pickedFile!.path}")),
                                )
                              : snapshot.data!.get('profileimage').toString() !=
                                      ""
                                  ? Image.network(
                                      snapshot.data!.get('profileimage'))
                                  : Icon(Icons.person),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Profile Picture',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const Divider(
                              thickness: 2,
                            ),
                            OutlinedButton.icon(
                              onPressed: () {
                                selectFile();
                              },
                              label: const Text('Add'),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              icon: const Icon(Icons.add),
                            ),
                            OutlinedButton.icon(
                              onPressed: () async {
                                final ref = snapshot.data!.get('profileimage');

                                String filePath = ref;

                                await FirebaseStorage.instance
                                    .ref()
                                    .child(filePath)
                                    .delete();

                                await FirebaseFirestore.instance
                                    .collection('Users')
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .set({
                                  'name': _nameController.text,
                                  'dob': _dobController.text,
                                  'passport': _passportController.text,
                                  'aadhar': _aadharController.text,
                                  'pan': _panController.text,
                                  'profileimage': ""
                                });
                              },
                              icon: const Icon(Icons.delete),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              label: const Text('Remove'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Text(
                      'Basic Details',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                              decoration: CustomDecoration
                                  .containerCornerRadiusDecoration,
                              child: TextFormField(
                                controller: _nameController,
                                decoration: CustomDecoration
                                        .textFormFieldDecoration('Full name')
                                    .copyWith(
                                        prefixIcon: const Icon(Icons.person)),
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
                              decoration: CustomDecoration
                                  .containerCornerRadiusDecoration,
                              child: TextFormField(
                                controller: _dobController,
                                decoration:
                                    CustomDecoration.textFormFieldDecoration(
                                            'Date of Birth')
                                        .copyWith(
                                            prefixIcon: const Icon(
                                                Icons.calendar_month)),
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
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                              decoration: CustomDecoration
                                  .containerCornerRadiusDecoration,
                              child: TextFormField(
                                controller: _passportController,
                                decoration:
                                    CustomDecoration.textFormFieldDecoration(
                                            'Passport number')
                                        .copyWith(
                                            prefixIcon: const Icon(
                                                Icons.numbers_rounded)),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: CustomDecoration
                                  .containerCornerRadiusDecoration,
                              child: TextFormField(
                                controller: _aadharController,
                                decoration:
                                    CustomDecoration.textFormFieldDecoration(
                                            'Aadhar card number')
                                        .copyWith(
                                            prefixIcon: const Icon(
                                                Icons.numbers_rounded)),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: CustomDecoration
                                  .containerCornerRadiusDecoration,
                              child: TextFormField(
                                controller: _panController,
                                decoration:
                                    CustomDecoration.textFormFieldDecoration(
                                            'Pan card number')
                                        .copyWith(
                                            prefixIcon: const Icon(
                                                Icons.numbers_rounded)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final ref = FirebaseStorage.instance
                          .ref()
                          .child('url')
                          .child(pickedFile!.name.toString());
                      await ref.putFile(imageFile);
                      String url = await ref.getDownloadURL();

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
                        'profileimage': pickedFile == null ? "" : url,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Data Saved Successfully!')));
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
            );
          }),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;

      if (pickedFile != null) {
        imageFile = File(pickedFile!.path!);
      }
    });
  }

  Future<dynamic>? progressIndicater(BuildContext context, showLoading) {
    if (showLoading == true) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
    } else {
      return null;
    }
  }
}
