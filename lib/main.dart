import 'package:care_notes/constants.dart';
import 'package:care_notes/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  static const TextStyle themeTextStyle = TextStyle(height: 1.2, fontSize: /*17*/15);

  final textTheme = const TextTheme(
    bodyText1: themeTextStyle,
    bodyText2: themeTextStyle,
  ).apply(
    bodyColor: Colors.grey[600],
    displayColor: Colors.grey[600],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Care Notes',
      theme: ThemeData(
        // textTheme: ,
        textTheme: GoogleFonts.nunitoTextTheme(textTheme).copyWith(
          bodyText1: GoogleFonts.nunito(textStyle: themeTextStyle),
          bodyText2: GoogleFonts.nunito(textStyle: themeTextStyle),
        ),

        cardTheme: const CardTheme(elevation: 4),
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: /*18*/16)),
        primarySwatch: Constants.generateMaterialColor(Constants.light_blue),
      ),
      home: const HomePage(),
    );
  }
}
