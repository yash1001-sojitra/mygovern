import 'package:flutter/material.dart';
import 'package:mygovern/Screens/Profile/profile.dart';
import 'package:mygovern/Screens/drawerscreens/aboutus.dart';
import 'package:mygovern/Screens/drawerscreens/setting.dart';

class Drawerbtn extends StatelessWidget {
  const Drawerbtn({Key? key}) : super(key: key);
  final style = const TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.25,
      child: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/jansevadrawer.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profile(),
                  ),
                );
              },
              child: const Text(
                'Profile',
                style: TextStyle(
                    letterSpacing: 3,
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profile(),
                  ),
                );
              },
              child: const Text(
                'Request Document',
                style: TextStyle(
                    letterSpacing: 3,
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Setting(),
                  ),
                );
              },
              child: const Text(
                'Settings',
                style: TextStyle(
                    letterSpacing: 3,
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutUs(),
                  ),
                );
              },
              child: const Text(
                'About Us',
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 3,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: const Center(
                  child: Text(
                    'v1.0.0',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 20,
                      color: Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
