/*
* File : Sleep App
* Created by : Utrodus Said Al Baqi
* Version : 1.0.0
* */

import 'package:flutter/material.dart';

/// Default Value
double defaultMargin = 32.0;
double defaultPadding = 18.0;
double defaultRadius = 12.0;

/// Colors
const Color kPrimaryColor = Color(0xff03174C);
const Color kprimaryTextColor = Color(0xffE6E7F2);
const Color kSecondaryColor = Color(0xff8E97FD);
const Color kSecondaryTextColor = Color(0xffEBEAEC);
const Color kBackgroundColor = kPrimaryColor;
const Color kLightPurpleColor = Color(0xff586894);
const Color kMediumPurpleColor = Color(0xff1F265E);
const Color kMediumPurpleTextColor = Color(0xff98A1BD);
const Color kWhiteColor = Color(0xFFFFFFFF);
const Color kShimmerBaseColor = Color(0xFFF5F5F5);
const Color kShimmerHightlightColor = Color(0xFFE0E0E0);

/// Text Styles
TextStyle primaryTextStyle =
    const TextStyle(color: kprimaryTextColor, fontFamily: "Roboto");
TextStyle secondaryTextStyle =
    const TextStyle(color: kSecondaryTextColor, fontFamily: "Roboto");
TextStyle mediumTextStyle =
    const TextStyle(color: kMediumPurpleTextColor, fontFamily: "Roboto");
TextStyle whiteTextStyle =
    const TextStyle(color: kWhiteColor, fontFamily: "Roboto");

/// Fonts Weight
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight bold = FontWeight.w700;

class AppThemes {
  AppThemes._();

  static const Color _lightPrimaryColor = kPrimaryColor;

  static const Color _lightPrimaryVariantColor = kWhiteColor;
  static const Color _lightButtonPrimaryColor = kSecondaryColor;
  static const Color _lightIconColor = Color(0xffE6E7F2);

  static final ThemeData sleepTheme = ThemeData(
    fontFamily: "Roboto",
    scaffoldBackgroundColor: _lightPrimaryVariantColor,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        color: _lightPrimaryVariantColor,
      ),
      backgroundColor: kPrimaryColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: kWhiteColor,
        fontWeight: bold,
        fontSize: 18,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: _lightPrimaryColor,
      secondary: kMediumPurpleColor,
      onPrimary: kWhiteColor,
    ),
    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 24,
        fontWeight: bold,
        color: kWhiteColor,
      ),
      headline2: TextStyle(
        fontSize: 24,
        fontWeight: regular,
        color: kWhiteColor,
      ),
      headline3: TextStyle(
        fontSize: 20,
        fontWeight: medium,
        color: kWhiteColor,
      ),
      headline4: TextStyle(
        fontSize: 18,
        fontWeight: bold,
        color: kWhiteColor,
      ),
      headline5: TextStyle(
        fontSize: 16,
        fontWeight: bold,
        color: kWhiteColor,
      ),
      headline6: TextStyle(
        fontSize: 14,
        fontWeight: medium,
        color: kWhiteColor,
      ),
      subtitle1: TextStyle(
        fontSize: 14,
        fontWeight: bold,
        color: kWhiteColor,
      ),
      subtitle2: TextStyle(
        fontSize: 12,
        fontWeight: bold,
        color: kWhiteColor,
      ),
      bodyText1: TextStyle(
        fontSize: 15,
        fontWeight: regular,
        color: kSecondaryTextColor,
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        fontWeight: light,
        color: kSecondaryTextColor,
      ),
    ),
    scrollbarTheme: ScrollbarThemeData(
        thickness: MaterialStateProperty.all(10),
        thumbColor: MaterialStateProperty.all(
          kprimaryTextColor,
        ),
        radius: const Radius.circular(10),
        minThumbLength: 100),
    buttonTheme: const ButtonThemeData(
      buttonColor: _lightButtonPrimaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    unselectedWidgetColor: _lightPrimaryColor,
  );
}
