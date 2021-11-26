import 'package:flutter/material.dart';
import 'package:southwind/UI/home/career_tab/page/questions_page.dart';
import 'package:southwind/UI/home/home_screen.dart';

class Routes {
  static const String homePage = "/homePage";
  static const String QuestionPage = "/homePage/QuestionPage";
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
        default:
          page = Container();
      }
      return page;
    });
  }
}
