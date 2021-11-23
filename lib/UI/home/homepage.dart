import 'package:flutter/material.dart';
import 'package:southwind/UI/home/news_tab/news_screen.dart';
import 'package:southwind/UI/theme/apptheme.dart';
import 'package:southwind/component/bottom_navigation.dart';
import 'package:southwind/component/navigationtheme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  var type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Southwind".toUpperCase(),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        leading: Icon(Icons.menu),
        centerTitle: true,
      ),
      body: NewsScreen(),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBackgroundColor: primarySwatch[50]!,
          selectedItemIconColor: Colors.black,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.feed_outlined,
            label: 'News',
          ),
          FFNavigationBarItem(
            iconData: Icons.schedule_outlined,
            label: 'Schedule',
          ),
          FFNavigationBarItem(
            iconData: Icons.hiking_outlined,
            label: 'Career',
          ),
          FFNavigationBarItem(
            iconData: Icons.groups_outlined,
            label: 'Team',
          ),
          FFNavigationBarItem(
            iconData: Icons.account_circle_outlined,
            label: 'Settings',
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
