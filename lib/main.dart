import 'package:care_notes/constants.dart';
import 'package:care_notes/pages/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  static const TextStyle themeTextStyle =
      TextStyle(height: 1.2, fontSize: /*17*/ 15);

  final textTheme = const TextTheme(
    bodyText1: themeTextStyle,
    bodyText2: themeTextStyle,
  ).apply(
    bodyColor: Colors.grey[600],
    displayColor: Colors.grey[600],
  );

  double getFraction(scrWidth, scrHeight) {
    double widthFraction = 1.0;

    if (kIsWeb) {
      final finalWidth = (9 / 16) * scrHeight;
      widthFraction = finalWidth / scrWidth;
    }

    return widthFraction;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Add width condition of Web
        print(getFraction(constraints.maxWidth, constraints.maxHeight));
        if (constraints.maxHeight < 650) {
          return MaterialApp(
            home: Scaffold(
              body: Container(
                alignment: Alignment.center,
                child: Card(
                  elevation: 8,
                  child: Container(
                    alignment: Alignment.center,
                    width: 300,
                    height: 160,
                    child: Text(
                      "screen size too small!",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
              ),
            ),
          );
          // return MediaQuery(
          //     data: MediaQueryData(),
          //     child: Directionality(
          //         textDirection: TextDirection.ltr,
          //         child: SingleChildScrollView(
          //           child: FractionallySizedBox(
          //               widthFactor: (700 * (9 / 16)) / constraints.maxWidth,
          //               heightFactor: 700 / constraints.maxHeight,
          //               child: getMaterialApp()),
          //         )));
        }
        return FractionallySizedBox(
            widthFactor:
                getFraction(constraints.maxWidth, constraints.maxHeight),
            child: getMaterialApp());
      },
    );
  }

  MaterialApp getMaterialApp() {
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
            titleTextStyle:
                TextStyle(color: Colors.white, fontSize: /*18*/ 16)),
        primarySwatch: Constants.generateMaterialColor(Constants.light_blue),
      ),
      home: const HomePage(),
    );
  }
}
