import 'package:flutter/material.dart';
import 'package:southwind/UI/home/career_tab/page/questions_page.dart';
import 'package:southwind/UI/home/chat_tab/single_chat_screen.dart';
import 'package:southwind/UI/home/home_screen.dart';

class Routes {
  static const String homePage = "/homePage";
  static const String QuestionPage = "/homePage/QuestionPage";
  static const String singleChatScreen = "/SingleChatScreen";
  static Route<dynamic> onRouteGenerate(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      Widget page;
      switch (settings.name) {
        case Routes.homePage:
          page = HomeScreen();
          break;
        case Routes.QuestionPage:
          page = QuestionsPage();
          break;
        case Routes.singleChatScreen:
          page = SingleChatScreen();
          break;
        default:
          page = Container();
      }
      return page;
    });
  }
}
