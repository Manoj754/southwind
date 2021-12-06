import 'package:flutter/material.dart';
import 'package:southwind/UI/home/career_tab/page/questions_page.dart';
import 'package:southwind/UI/home/chat_tab/group_Info.dart';
import 'package:southwind/UI/home/chat_tab/group_chat_screen.dart';
import 'package:southwind/UI/home/chat_tab/single_chat_screen.dart';
import 'package:southwind/UI/home/clock_in_out/work_history.dart';
import 'package:southwind/UI/home/home_screen.dart';

class Routes {
  static const String homePage = "/homePage";
  static const String QuestionPage = "/homePage/QuestionPage";
  static const String singleChatScreen = "/SingleChatScreen";
  static const String groupChatScreen = "/GroupChatScreen";
  static const String groupInfo = "/GroupInfo";
  static const String clockInOutScreen = "/clockInOutScreen";

  static Route<dynamic> onRouteGenerate(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      Widget page;
      switch (settings.name) {
        // case Routes.homePage:
        //   page = HomeScreen();
        //   break;
        case Routes.clockInOutScreen:
          page = WorkHistory();
          break;
        case Routes.QuestionPage:
          page = QuestionsPage();
          break;
        case Routes.singleChatScreen:
          page = SingleChatScreen();
          break;
        case Routes.groupInfo:
          page = GroupInfo();
          break;
        case Routes.groupChatScreen:
          page = GroupChatScreen();
          break;
        default:
          page = Container(
            child: Text('no route'),
          );
      }
      return page;
    });
  }
}
