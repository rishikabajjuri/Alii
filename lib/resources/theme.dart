import 'package:flutter/material.dart';

class BTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
        fontFamily: 'Nunito_Sans',
        accentColor: primaryColor,
        cursorColor: primaryColor,
        buttonTheme: ButtonThemeData(
            colorScheme: colorScheme,
            height: 50,
            minWidth: 100,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            buttonColor: primaryColor,
            textTheme: ButtonTextTheme.primary));
  }

  static final Color primaryColor = Colors.deepPurple.shade800;
//  static final Color secondaryColor = HexColor('#6908D6');
  static final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
//    secondary: secondaryColor,
  );
}