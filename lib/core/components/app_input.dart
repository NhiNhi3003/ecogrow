import 'package:eco_grow/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInput extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType? keyboardType;
  const AppInput({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: TextStyle(
          fontSize: 16.sp,
          color: AppColor.accentColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
