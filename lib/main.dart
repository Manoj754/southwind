import 'package:flutter/material.dart';
import 'package:southwind/UI/home/homepage.dart';
import 'package:southwind/UI/theme/apptheme.dart';
import 'package:southwind/component/bottom_navigation.dart';
import 'package:southwind/component/navigationtheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Southwind',
      theme: ThemeData(
        fontFamily: 'Poppins',
        appBarTheme: AppBarTheme(
            backgroundColor: primaryColor,
            iconTheme: IconThemeData(color: Colors.white)),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black),
        ),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: primarySwatch,
      ),
      home: HomePage(),
    );
  }
}
