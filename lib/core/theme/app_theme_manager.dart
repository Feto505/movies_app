import 'package:flutter/material.dart';

import 'colors_palette.dart';

class AppThemeManager {
  static ThemeData themeData = ThemeData(
    primaryColor: ColorsPalette.primaryColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsPalette.greyDarkColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsPalette.primaryColor,
      selectedIconTheme: IconThemeData(
        color: ColorsPalette.primaryColor,
        size: 45,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedIconTheme: IconThemeData(
        color: Color(0xffffffff),
        size: 35,
      ),
      unselectedItemColor: Color(0xffffffff),
      unselectedLabelStyle: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w800,
        fontSize: 11,
      ),
      //type: BottomNavigationBarType.shifting
    ),
    scaffoldBackgroundColor: Color(0xff1E1E1E),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(size: 25, color: Colors.white),
        backgroundColor: Color(0xff1E1E1E),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 22,
          // fontWeight: FontWeight.bold,
          fontFamily: "Inter",
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ))),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: "Inter",
          color: Colors.white),
      bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "Inter",
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        fontFamily: "Inter",
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        fontFamily: "Inter",
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: "Inter",
        color: Colors.white,
      ),
    ),
  );
}
