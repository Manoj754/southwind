import 'package:flutter/material.dart';
import 'package:southwind/UI/theme/apptheme.dart';

class Incentives extends StatefulWidget {
  const Incentives({Key? key}) : super(key: key);

  @override
  _IncentivesState createState() => _IncentivesState();
}

class _IncentivesState extends State<Incentives> {
  int selectedIndex = 0;
  List<String> tabs = ['New', 'Most Popular', 'Purchased'];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: primarySwatch[900],
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primarySwatch[900]!, primarySwatch[600]!],
                  stops: [.2, .8],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              height: size.height * .3,
              // width: size.width,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Awailable Incentives",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "250",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            for (int i = 0; i < tabs.length; i++)
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(1000),
                    onTap: () {
                      setState(() {
                        selectedIndex = i;
                        // showsecondpop = !showsecondpop;
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
                          child: Center(
                            child: Text(
                              tabs[i],
                              maxLines: 1,
                              overflow: TextOverflow.visible,
                              style: selectedIndex != i
                                  ? TextStyle(
                                      color: primarySwatch[900],
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)
                                  : TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        Expanded(
          child: ListView.builder(
              itemCount: incentivesList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          child: Image.network(
                            incentivesList[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${incentivesList[index].name}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                            Text(
                              "${incentivesList[index].tokens}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.black, height: 1),
                            )
                          ],
                        ),
                        Spacer(),
                        if (selectedIndex != 2)
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: primarySwatch[900]!),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                child: Text(
                                  "Buy",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        SizedBox(
                          width: 10,
                        ),
                        // Row(
                        //   children: [
                        //     Icon(Icons.attach_money),
                        //     Text(
                        //       "${Revenuelist[index].income}",
                        //       style: TextStyle(fontWeight: FontWeight.bold),
                        //     )
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  // child: ListTile(
                  //   horizontalTitleGap: 0,
                  //   leading: Text("${index + 1}"),
                  // title: Text(
                  //   "${Revenuelist[index].title}",
                  //   style: TextStyle(
                  //       fontWeight: FontWeight.w600, fontSize: 14),
                  // ),
                  //   subtitle: Text("${Revenuelist[index].subtitle}"),
                  //   trailing: Container(
                  //     width: 100,
                  // child: Row(
                  //   children: [
                  //     Icon(Icons.attach_money),
                  //     Text(
                  //       "${Revenuelist[index].income}",
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.bold),
                  //     )
                  //   ],
                  // ),
                  //   ),
                  // ),
                );
              }),
        ),
      ],
    );
  }
}

class IncentiveModel {
  String image;
  String name;
  String tokens;
  IncentiveModel(
      {this.image =
          "https://images.unsplash.com/photo-1633113215844-b2ddc0411724?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      this.name = "Culture Coin",
      this.tokens = "134"});
}

List<IncentiveModel> incentivesList = [
  IncentiveModel(),
  IncentiveModel(),
  IncentiveModel(),
];
