import 'package:care_notes/constants.dart';
import 'package:care_notes/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static const TextStyle themeTextStyle = TextStyle(height: 1.2, fontSize: 17);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Care Notes',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: themeTextStyle,
          bodyText2: themeTextStyle,
        ).apply(
          bodyColor: Colors.grey[600],
          displayColor: Colors.grey[600],
        ),
        cardTheme: const CardTheme(elevation: 4),
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 18)),
        primarySwatch: Constants.generateMaterialColor(Constants.light_blue),
      ),
      home: const HomePage(),
    );
  }
}
