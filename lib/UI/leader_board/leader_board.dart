import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:southwind/UI/components/common_appbar.dart';
import 'package:southwind/UI/theme/apptheme.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  int value = 0;

  String dropdownValue = 'One';
  bool isDropdownOpened = false;
  bool showsecondpop = false;
  List<String> tabs = ['Revenue', 'AJS', 'R.Hour', 'NPS'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "LEADERBOARD",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        actions: [
          Container(margin: EdgeInsets.only(right: 15), child: Icon(Icons.menu))
        ],
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: GestureDetector(
          //     onTap: () {
          //       setState(() {
          //         isDropdownOpened = !isDropdownOpened;
          //       });
          //     },
          //     child: Container(
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(8),
          //           color: primarySwatch[900]),
          //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          //       child: Row(
          //         children: [
          //           Text(
          //             "Revenue".toUpperCase(),
          //             style: TextStyle(
          //                 fontSize: 22,
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.bold,
          //                 letterSpacing: 1),
          //           ),
          //           Spacer(),
          //           Icon(
          //            isDropdownOpened ?  Icons.arrow_drop_down: Icons.arrow_drop_up,
          //             color: Colors.white,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // )
          ExpansionTile(
            onExpansionChanged: (v) {
              setState(() {});
            },
            title: Text(
              "revenue".toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            children: [
              RadioListTile(
                value: 1,
                groupValue: value,
                onChanged: (val) {
                  setState(
                    () {
                      value != val;
                    },
                  );
                },
                title: Text("Male"),
              ),
              RadioListTile(
                value: 2,
                groupValue: value,
                onChanged: (val) {
                  setState(
                    () {
                      value != val;
                    },
                  );
                },
                title: Text("Female"),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  for (int i = 0; i < tabs.length; i++)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 10),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(1000),
                          onTap: () {
                            setState(() {
                              selectedIndex = i;
                              showsecondpop = !showsecondpop;
                            });
                          },
                          child: Material(
                            color: Colors.transparent,
                            elevation: selectedIndex == i ? 10 : 0,
                            borderRadius: BorderRadius.circular(1000),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: selectedIndex == i
                                      ? primarySwatch[700]
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: primarySwatch[900]!, width: .5)),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Text(
                                  tabs[i],
                                  maxLines: 1,
                                  overflow: TextOverflow.visible,
                                  style: selectedIndex != i
                                      ? TextStyle(
                                          color: primarySwatch[900],
                                          fontWeight: FontWeight.bold)
                                      : TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                              )),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              if (selectedIndex == 0)
                Container(
                  height: size.height * 0.5,
                  child: ListView.builder(
                      itemCount: Revenuelist.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: Text("${index + 1}"),
                              title: Text("${Revenuelist[index].title}"),
                              subtitle: Text("${Revenuelist[index].subtitle}"),
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  children: [
                                    Icon(Icons.attach_money),
                                    Text("${Revenuelist[index].income}")
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              endIndent: 20,
                              indent: 20,
                              height: 0,
                            ),
                          ],
                        );
                      }),
                ),
              if (selectedIndex == 1)
                Container(
                  height: size.height * 0.5,
                  child: ListView.builder(
                      itemCount: Revenuelist.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: Text("${index + 1}"),
                              title: Text("${Revenuelist[index].title}"),
                              subtitle: Text("${Revenuelist[index].subtitle}"),
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  children: [
                                    Icon(Icons.attach_money),
                                    Text("${Revenuelist[index].income}")
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              endIndent: 20,
                              indent: 20,
                              height: 0,
                            ),
                          ],
                        );
                      }),
                ),
              if (selectedIndex == 2)
                Container(
                  height: size.height * 0.5,
                  child: ListView.builder(
                      itemCount: Revenuelist.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: Text("${index + 1}"),
                              title: Text("${Revenuelist[index].title}"),
                              subtitle: Text("${Revenuelist[index].subtitle}"),
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  children: [
                                    Icon(Icons.attach_money),
                                    Text("${Revenuelist[index].income}")
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              endIndent: 20,
                              indent: 20,
                              height: 0,
                            ),
                          ],
                        );
                      }),
                ),
              if (selectedIndex == 3)
                Container(
                  height: size.height * 0.5,
                  child: ListView.builder(
                      itemCount: Revenuelist.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: Text("${index + 1}"),
                              title: Text("${Revenuelist[index].title}"),
                              subtitle: Text("${Revenuelist[index].subtitle}"),
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  children: [
                                    Icon(Icons.attach_money),
                                    Text("${Revenuelist[index].income}")
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              endIndent: 20,
                              indent: 20,
                              height: 0,
                            ),
                          ],
                        );
                      }),
                ),
            ],
          ),
        ],
      ),
    ));
  }
}

class Revenuelistclass {
  String title;
  String subtitle;
  String income;
  Revenuelistclass(
      {required this.title, required this.subtitle, required this.income});
}

List<Revenuelistclass> Revenuelist = [
  Revenuelistclass(
      title: "Chumley, Layke", subtitle: "Indy", income: "35,096.31"),
  Revenuelistclass(
      title: "Gracia Gonzalez,joel", subtitle: "Indy", income: "33,263.44"),
  Revenuelistclass(
      title: "Morris, john", subtitle: "Indy", income: "32,246.80"),
  Revenuelistclass(
      title: "Pla, Anthony", subtitle: "ATLNW", income: "29,140.61"),
  Revenuelistclass(
      title: "Nadir, Mohammad", subtitle: "Omaha", income: "28,624.35"),
];
