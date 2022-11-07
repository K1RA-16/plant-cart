import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.orange,
      fontFamily: GoogleFonts.aBeeZee().fontFamily,
      //scaffoldBackgroundColor: LinearGradient(colors: gradientColor),
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        titleTextStyle: Theme.of(context).textTheme.headline6,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.lightBlue,
      );
  static Color backgroundColor = (Colors.white);
  static Color green = const Color.fromARGB(255, 82, 117, 58);
  static Color textColor = const Color(0xff03525C);
}
