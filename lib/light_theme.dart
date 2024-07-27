import 'package:flutter/material.dart';

/*--------------------------------------- Colors ----------------------------------------*/
const kColorPrimary = Color(0xff05B46E);
const kColorBackground = Color(0xffF6F6F6);
const kColorWhite = Color(0xffffffff);
const kColorWhite1 = Color(0xffFCFFFE);
const kColorWhiteGrey = Color(0xff79C5A6);
const kColorBlack = Color(0xff292929);
const kColorBlackLight = Color(0xff505352);
const kColorGrey = Color(0xff929292);
const kColorSwitchInactiveGrey = Color(0xffE4E4E4);
const kColorGreen = Color(0xff0E794E);
const kColorDeepYellow = Color(0xffFBA525);
const kColorBlue = Color(0xff03A0F9);
const kColorFacebook = Color(0xff1877F2);
const kColorDeepGreen = Color(0xff032316);
const kColorDeepGreen2 = Color(0xff037E4D);
const kColorRed = Color(0xffFF5C5C);
const kColorBlackGray = Color(0xff666666);
const kColorLightGray = Color(0xffF9F9F9);
const kColorOrangeYellow = Color(0xffA7850D);
const kColorOlive = Color(0xFFcff8e7);
const kColorlightYellow = Color(0xFFFFF3CA);
const kColorDeepLightYellow = Color(0xFFDECC8E);
const kColorDeepLightYellow1 = Color(0xFFfff3c9);
const kColorDeepLightYellow2 = Color(0xFFdacfa2);
const kColorDeepGray = Color(0xffFAFAFA);
const kColorDeepGray2 = Color(0xffE2E2E2);
const kColorOffWhite =  Color.fromARGB(255, 255, 250, 250);
const kColorGreen2 = Color(0xff045132);
const Color errColor = Color(0xFFBE2E2E);
const Color borderColor = Color(0xffF4F4F4);

/*--------------------------------------- Styles ----------------------------------------*/
const kStyleTextW400CW =
TextStyle(color: kColorWhite, fontWeight: FontWeight.w400);
const kStyleTextW400CG =
TextStyle(color: kColorGrey, fontWeight: FontWeight.w400);
const kStyleTextW600CW =
TextStyle(color: kColorWhite, fontWeight: FontWeight.w600);
const kStyleTextW600CB =
TextStyle(color: kColorBlack, fontWeight: FontWeight.w600);
const kStyleTextW600CR =
TextStyle(color: kColorRed, fontWeight: FontWeight.w600);
const kStyleTextW500CW =
TextStyle(color: kColorWhite, fontWeight: FontWeight.w500);
const kStyleTextW500CBG =
TextStyle(color: kColorBlackGray, fontWeight: FontWeight.w500);
const kStyleTextW500CR =
TextStyle(color: kColorRed, fontWeight: FontWeight.w500);
const kStyleTextW500CDY =
TextStyle(color: kColorDeepYellow, fontWeight: FontWeight.w500);
const kStyleTextW500CBlue =
TextStyle(color: kColorBlue, fontWeight: FontWeight.w500);
const kStyleTextW500CP =
TextStyle(color: kColorPrimary, fontWeight: FontWeight.w500);
const kStyleTextW700CW =
TextStyle(color: kColorWhite, fontWeight: FontWeight.w700);
const kStyleTextW400CB =
TextStyle(color: kColorBlack, fontWeight: FontWeight.w400);
const kStyleTextW400CGR = TextStyle(
  color: kColorGreen,
  fontWeight: FontWeight.w400,
);
const kStyleTextW600CP =
TextStyle(color: kColorPrimary, fontWeight: FontWeight.w600);
const kStyleTextW600CYO =
TextStyle(color: kColorOrangeYellow, fontWeight: FontWeight.w600);
const kStyleTextW600CG =
TextStyle(color: kColorGrey, fontWeight: FontWeight.w600);
const kStyleTextW500CB =
TextStyle(color: kColorBlack, fontWeight: FontWeight.w500);
const kStyleTextW500CG =
TextStyle(color: kColorGrey, fontWeight: FontWeight.w500);
const kStyleTextW500CBL =
TextStyle(color: kColorBlackLight, fontWeight: FontWeight.w500);
const kStyleTextW700CP =
TextStyle(color: kColorPrimary, fontWeight: FontWeight.w700);
const kStyleTextW400CYO =
TextStyle(color: kColorOrangeYellow, fontWeight: FontWeight.w400);

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(iconColor: MaterialStateProperty.all(kColorWhite)),
  ),
  scaffoldBackgroundColor: kColorBackground,
  primaryColor: kColorPrimary,
  textTheme: const TextTheme(),
  appBarTheme: const AppBarTheme(
    backgroundColor: kColorPrimary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kColorPrimary,
      foregroundColor: kColorWhite,
      padding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      elevation: 0,
    ),
  ),
);
