import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});

class Pallete {
  // Colors
  static const blackColor = Color(0xff000000);
  static const greyColor = Color(0xff6A8189);
  static const drawerColor = Color.fromRGBO(18, 18, 18, 1);
  static const whiteColor = Color(0xffFFFFFF);
  static const yellowColor = Color(0xffFFEB3B);
  static const textBlack = Color(0xff101828);
  static const textGrey = Color(0xff475467);
  static const textGreydarker = Color(0xff344054);
  static const textGreylighter = Color(0xff667085);
  static const borderGrey = Color(0xffD0D5DD);
  static const dotGreyColor = Color(0xffF2F4F7);
  static const dividerGreyColor = Color(0xffEAECF0);
  // static const blueColor = Color(0xff2196F3);
  static const blueColor = Color(0xff2196F3);
  static const orangeColor = Color(0xffFF9800);
  static const red = Color(0xffD92D20);
  static const lightRed = Color(0xffFEE4E2);
  static const newGrey = Color(0xffF2F4F7);
  static const completeGreen = Color(0xff039855);
  static const completeGreenContainer = Color(0xffD1FADF);
  static const processingOrange = Color(0xffF79009);
  static const processingOrangeContainer = Color(0xffFEF0C7);
  static const redColor = Color(0xffF44336);
  static const cancelledRedContainer = Color(0xffFEE4E2);
  static const shadowGrey = Color(0xff827878);
  static const trackOrdersGrey = Color(0xffF9FAFB);
  static const tileBorderGrey = Color(0xffEAECF0);
  static const lighterRed = Color(0xffFEF3F2);
  static const pink = Color(0xffFECDCA);

  // Themes
  static var darkModeAppTheme = ThemeData.dark().copyWith(
    // textTheme: GoogleFonts.spaceGroteskTextTheme(),
    // textTheme: ThemeData.dark().textTheme.apply(
    //       fontFamily: 'Sk-Modernist',
    //     ),
    scaffoldBackgroundColor: blackColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: drawerColor,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: drawerColor,
    ),
    primaryColor: yellowColor,
    backgroundColor:
        drawerColor, // will be used as alternative background color
    canvasColor: greyColor,
  );

  static var lightModeAppTheme = ThemeData.light().copyWith(
      // textTheme: GoogleFonts.spaceGroteskTextTheme(),
      // textTheme: ThemeData.light().textTheme.apply(
      //       fontFamily: 'Sk-Modernist',
      //     ),
      scaffoldBackgroundColor: whiteColor,
      cardColor: greyColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: whiteColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: blackColor,
        ),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: whiteColor,
      ),
      primaryColor: yellowColor,
      backgroundColor: whiteColor,
      canvasColor: blackColor);
}

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeMode _mode;
  ThemeNotifier({ThemeMode mode = ThemeMode.dark})
      : _mode = mode,
        super(
          Pallete.darkModeAppTheme,
        ) {
    getTheme();
  }

  ThemeMode get mode => _mode;

  void getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');

    if (theme == 'light') {
      _mode = ThemeMode.light;
      state = Pallete.lightModeAppTheme;
    } else {
      _mode = ThemeMode.dark;
      state = Pallete.darkModeAppTheme;
    }
  }

  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_mode == ThemeMode.dark) {
      _mode = ThemeMode.light;
      state = Pallete.lightModeAppTheme;
      prefs.setString('theme', 'light');
    } else {
      _mode = ThemeMode.dark;
      state = Pallete.darkModeAppTheme;
      prefs.setString('theme', 'dark');
    }
  }
}
