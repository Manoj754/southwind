import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:southwind/UI/components/common_appbar.dart';
import 'package:southwind/UI/library/video_tab.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "LIBRARY",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
        ),
        actions: [
          Icon(
            Icons.menu_outlined,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    // margin: EdgeInsets.only(left: 15),
                    height: 40,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.search_outlined,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Search",
                        ),
                      ],
                    )),
                Icon(
                  Icons.filter_list_outlined,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Mes.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => VideoTab(
                                    title: Mes[index].mesg,
                                  )),
                        );
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8),
                      child: Container(
                        // margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                            )
                          ],
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // SizedBox(
                            //   width: 10,
                            // ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Text(
                                "${Mes[index].mesg}",
                                //style: TextStyle(height: 1.5),
                              ),
                            ),
                            // SizedBox(
                            //   width: 40,
                            // ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 15),
                              child: Icon(
                                Icons.chevron_right_outlined,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class mes {
  String mesg;
  mes({required this.mesg});
}

List<mes> Mes = [
  mes(mesg: "#NoSafetyKnowPain Episode 2"),
  mes(mesg: "CSL Training - SCENARIO 2"),
  mes(mesg: "CSL Training - SCENARIO 1"),
  mes(mesg: "Padding & Wrapping Glass"),
  mes(mesg: "1-800-GOT-JUNK? The \nImportance of Junk Patrols &\nRole Play"),
  mes(
      mesg:
          "1-800-GOT-JUNK? Grand Rapids \n- Negotiation Protocol&\nRole Play"),
  mes(mesg: "1-800-GOT-JUNK? Grand Rapids \n- Recycling Center Info"),
];
