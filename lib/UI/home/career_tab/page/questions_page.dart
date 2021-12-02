import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:southwind/UI/components/common_appbar.dart';
import 'package:southwind/UI/components/common_button.dart';
import 'package:southwind/UI/home/career_tab/components/information_dialog.dart';
import 'package:southwind/UI/home/career_tab/page/congratsScreen.dart';
import 'package:southwind/UI/home/career_tab/page/summary_screen.dart';
import 'package:southwind/UI/theme/apptheme.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int currentQuestion = 0;
  int totalQuestion = 10;
  PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      showInformationDialog(context);
    });
  }

  animateToQuestion() {
    _pageController.jumpToPage(currentQuestion);
    // _pageController.animateToPage(currentQuestion,
    //     duration: Duration(milliseconds: 400), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double radius = 20;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CommonAppbar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Card(
              color: Colors.transparent,
              margin: EdgeInsets.all(0),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
              )),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius),
                ),
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(radius),
                        bottomRight: Radius.circular(radius),
                      )),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Text(
                          "Being Exceptional at Accountabilty",
                          style: TextStyle(
                              color: primarySwatch[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 60,
                        child: QuestionsTab(
                          totalQuestion: 10,
                          currentQuestion: currentQuestion,
                          onTap: (a) {
                            this.currentQuestion = a;

                            setState(() {});
                            animateToQuestion();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: PageView(
              controller: _pageController,
              children: [
                for (int i = 0; i < totalQuestion; i++) QuestionAnswerWidget(),
              ],
              onPageChanged: (a) {
                currentQuestion = a;

                setState(() {});
              },
            )),
            // Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, -1),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    topRight: Radius.circular(radius),
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                child: Row(
                  children: [
                    CommonButton(
                      isExpanded: true,
                      lable: "Previous",
                      isLeading: true,
                      ontap: () {
                        if (currentQuestion != 0) currentQuestion--;

                        setState(() {});
                        animateToQuestion();
                      },
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Icon(
                          Icons.west,
                          size: 25,
                          color: primarySwatch[900],
                        ),
                      ),
                    ),
                    CommonButton(
                      isExpanded: true,
                      lable: "Next",
                      ontap: () {
                        // currentQuestion++;

                        // setState(() {});
                        // animateToQuestion();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SummaryScreen();
                        }));
                      },
                      isLeading: false,
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.east,
                          size: 25,
                          color: primarySwatch[900],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionAnswerWidget extends StatelessWidget {
  const QuestionAnswerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Explain Advantages of IOT with sutable example",
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Answer :",
            style: TextStyle(fontSize: 14, color: primarySwatch[700]),
          ),
          SizedBox(
            height: 2,
          ),
          TextFormField(
            maxLines: 6,
            style: TextStyle(
              fontSize: 16,
            ),
            decoration: InputDecoration(
                hintText: "Enter Your Answer",
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                isCollapsed: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        BorderSide(width: .5, color: primarySwatch[700]!)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        BorderSide(width: .5, color: primarySwatch[700]!)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(width: 1, color: primaryColor))),
          )
        ],
      ),
    );
  }
}

class QuestionsTab extends StatelessWidget {
  final int totalQuestion;
  final int currentQuestion;
  final Function(int) onTap;
  const QuestionsTab(
      {required this.totalQuestion,
      required this.currentQuestion,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              onTap(index);
            },
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentQuestion == index
                      ? primarySwatch[900]
                      : Colors.white,
                  border: Border.all(color: primarySwatch[800]!)),
              height: 40,
              width: 40,
              child: Center(
                  child: Text(
                "${index + 1}",
                style: TextStyle(
                    color: currentQuestion == index
                        ? Colors.white
                        : primarySwatch[900],
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: totalQuestion,
      padding: EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
