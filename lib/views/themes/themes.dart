import 'package:flutter/material.dart';
import 'package:shadat_pubg/views/themes/colors.dart';

ThemeData lightTheme = ThemeData.light(
  useMaterial3: true,
).copyWith(
  primaryColor: PubgColors.primaryColor,
  dividerColor: const Color(0xFFE9F0FD),
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.0,
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.0,
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.0,
        color: PubgColors.primaryColor,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.0,
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.0,
        color: PubgColors.primaryColor,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    filled: true,
    fillColor: Color(0xFFE9F0FD),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(
        PubgColors.primaryColor,
      ),
      foregroundColor: WidgetStateProperty.all<Color>(
        PubgColors.primaryColor,
      ),
      fixedSize: WidgetStateProperty.all<Size>(
        const Size(200, 50),
      ),
      textStyle: WidgetStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 18,
          color: PubgColors.whiteColor,
          fontFamily: "ElMessiri",
        ),
      ),
    ),
  ),
);
