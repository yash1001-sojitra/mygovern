// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mygovern/Screens/BottomBar_Screen/bookmark.dart';
import 'package:mygovern/Screens/BottomBar_Screen/home_screen.dart';
import 'package:mygovern/Screens/BottomBar_Screen/recent.dart';
import 'package:mygovern/Screens/Details_Screen/detailspage.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../../Logic/Widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final pages = [
    const HomeScreen(),
    const BookmarkScreen(),
    const RecentScreen()
  ];
  @override
  Widget build(BuildContext context) {
    String? result;
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) {
            return IconButton(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: SvgPicture.asset(
                    "assets/icons/drawer.svg",
                    height: 30,
                    width: 35,
                    color: Colors.white,
                  ),
                ));
          },
        ),
        elevation: 0,
        actions: [
          Builder(builder: (context) {
            return IconButton(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: SvgPicture.asset(
                  "assets/icons/search.svg",
                  height: 22,
                  width: 30,
                  color: Colors.white,
                ),
                onPressed: () async {
                  var result = await showSearch<String>(
                    context: context,
                    delegate: CustomDelegate(),
                  );
                  setState(() => result = result);
                });
          }),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: Color(0xff1a1a1a)),
        ),
      ),
      bottomNavigationBar: Buildmybottombar(context),
      drawer: const Drawerbtn(),
      body: pages[pageIndex],
    );
  }

  Container Buildmybottombar(BuildContext context) {
    return Container(
      height: 55,
      decoration: const BoxDecoration(
        color: Color(0xff1a1a1a),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: const Icon(
              CupertinoIcons.home,
              color: Colors.white,
              size: 30,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: const Icon(
              CupertinoIcons.bookmark,
              color: Colors.white,
              size: 30,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: const Icon(
              Icons.history,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) =>
      [IconButton(icon: const Icon(Icons.clear), onPressed: () => query = '')];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      icon: const Icon(Icons.chevron_left),
      onPressed: () => close(context, ''));

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) {
    // final animalList = Provider.of<List<CardData>?>(context);
    List documentlist = [];
    List<String> listToShow;
    List<String> documentnames = [];
    for (var element in documentlist) {
      documentnames.add(element.documentName.toLowerCase());
    }

    if (query.isNotEmpty) {
      listToShow = documentnames
          .where((e) =>
              e.contains(query.toLowerCase()) &&
              e.startsWith(query.toLowerCase()))
          .toList();
    } else {
      listToShow = documentnames;
    }
    return ListView.builder(
      itemCount: listToShow.length,
      itemBuilder: (_, i) {
        var animals = listToShow[i];
        return ListTile(
          title: Text(animals),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailsPage(),
                settings: RouteSettings(
                  arguments: documentnames[i],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
