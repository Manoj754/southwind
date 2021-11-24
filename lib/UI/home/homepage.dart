import 'package:flutter/material.dart';
import 'package:southwind/UI/home/news_tab/news_screen.dart';
import 'package:southwind/UI/theme/apptheme.dart';
import 'package:southwind/component/bottom_navigation.dart';
import 'package:southwind/component/menu_widget.dart';
import 'package:southwind/component/navigationtheme.dart';
import 'package:southwind/component/sidemenu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  GlobalKey<SliderMenuContainerState> _key =
  new GlobalKey<SliderMenuContainerState>();
  var type;

  late String title;
  @override
  void initState() {
    // TODO: implement initState
    title = "Southwind";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        title: Text(
          "Southwind".toUpperCase(),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        leading: Icon(Icons.menu),
        centerTitle: true,
      ),*/
      body:SafeArea(
        child:  SliderMenuContainer(
          appBarColor: primaryColor,
          appBarHeight: 50,
          key: _key,
          sliderMenuOpenSize:250,
          title: Text(
            title.toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize:18,fontWeight: FontWeight.w700),
          ),

          sliderMenu: MenuWidget(
            onItemClick: (title) {
              _key.currentState!.closeDrawer();
              setState(() {
                this.title = title;
              });
            },
          ),
          sliderMain: NewsScreen(),
        ),
      ),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
