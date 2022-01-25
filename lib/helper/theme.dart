import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukur_test/helper/schema.dart';

class AppTheme {
  ThemeData themeData(BuildContext context) {
    return ThemeData(
      colorScheme: const ColorScheme.light().copyWith(
        primary: kPrimaryColor,
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: kWhite,
          iconTheme: IconThemeData(color: kPrimaryColor),
          actionsIconTheme: IconThemeData(color: kPrimaryColor),
          centerTitle: false,
          elevation: 0.3,
          titleTextStyle: TextStyle(
              color: kPrimaryColor, fontSize: 18, fontWeight: FontWeight.w500)),
      textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context).textTheme,
      ),
      backgroundColor: kBackgroundColor,
    );
  }
}
