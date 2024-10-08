import 'package:eco_grow/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  AppStyle._();
  static TextStyle welcomeText = TextStyle(
    fontSize: 55.0.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.primaryColor,
  );
  static const TextStyle webHeaderItem = TextStyle(
      fontSize: 20.0, color: AppColor.blackColor, fontWeight: FontWeight.w400);
  static const TextStyle webHeaderItemActive = TextStyle(
      fontSize: 20.0, color: AppColor.whiteColor, fontWeight: FontWeight.bold);
  static const TextStyle bannerText = TextStyle(
      fontSize: 70.0, fontWeight: FontWeight.bold, color: AppColor.whiteColor);
  static const TextStyle textContent = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle titleText = TextStyle(
      fontSize: 40, fontWeight: FontWeight.bold, color: AppColor.accentColor);
  static const TextStyle headerTableText = TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.bold, color: AppColor.whiteColor);

  //web mobile
  static const TextStyle bannerTextWebMobile = TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.bold, color: AppColor.whiteColor);
  static const TextStyle titleTextWebMobile = TextStyle(
      fontSize: 25, fontWeight: FontWeight.bold, color: AppColor.accentColor);
  static const TextStyle textContentMobile = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle headerTableTextWebMobile = TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.bold, color: AppColor.whiteColor);
}
