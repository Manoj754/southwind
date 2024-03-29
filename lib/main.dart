import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:southwind/UI/theme/apptheme.dart';
import 'package:southwind/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Southwind',
      theme: ThemeData(
        brightness: Brightness.light,
        // scaffoldBackgroundColor: primarySwatch[50],
        // fontFamily: 'Poppins',
        appBarTheme: AppBarTheme(
            // color: primarySwatch[900]!,
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(color: primarySwatch[900]),
            // textTheme: Theme.of(context).textTheme,
            foregroundColor: primarySwatch[900],
            iconTheme: IconThemeData(color: primarySwatch[900])),
        textTheme: GoogleFonts.poppinsTextTheme(TextTheme(
            bodyText1: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: primarySwatch[900]),
            bodyText2: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: primarySwatch[900]))),
        // iconTheme: IconThemeData(color: primarySwatch[700]),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: generateMaterialColor(primaryColor),
      ),
      onGenerateRoute: Routes.onRouteGenerate,
      initialRoute: Routes.authWrapper,
    );
  }
}
