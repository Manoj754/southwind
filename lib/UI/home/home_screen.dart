import 'package:flutter/material.dart';
import 'package:southwind/UI/home/career_tab/career_tab.dart';
import 'package:southwind/UI/home/news_tab/news_screen.dart';
import 'package:southwind/UI/theme/apptheme.dart';
import 'package:southwind/component/bottom_navigation.dart';
import 'package:southwind/component/navigationtheme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          getWidget(),
          Align(
            alignment: Alignment.bottomCenter,
            child: FFNavigationBar(
              theme: FFNavigationBarTheme(
                barBackgroundColor: Colors.white,
                selectedItemBackgroundColor: primarySwatch[200]!,
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
                  iconData: Icons.school_outlined,
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
            ),
          ),
        ],
      ),
    );
  }

  getWidget() {
    switch (selectedIndex) {
      case 0:
        return NewsScreen();
      case 2:
        return CareerTab();
    }
    return Container();
  }
}
