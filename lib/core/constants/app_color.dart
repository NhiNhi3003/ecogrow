import 'package:flutter/material.dart';

class AppColor {
  static const primaryColor = Color(0xff677D63);
  static const blackColor = Color(0xff000000);
  static const accentColor = Color(0xff4CAF50);
  static const lightBackgroundColor = Color(0xffcff2e9);
  static const buttonColor = Color(0xffd1f7f1);
  static const whiteColor = Color(0xffffffff);
  static const textSecondaryColor = Color(0xff757575);
  static const homTitleTextColorize = [
    Color(0xff4CAF50),
    Color.fromARGB(255, 225, 255, 0),
  ];
  static List<BoxShadow> appBoxShaDowns = [
    BoxShadow(
      color: AppColor.blackColor.withOpacity(0.2),
      offset: const Offset(0, 2),
      blurRadius: 2,
      spreadRadius: 1,
    )
  ];
}
