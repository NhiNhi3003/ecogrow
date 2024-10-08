import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final String textButton;
  final double? width;
  final double? height;
  final bool? isLoading;
  const AppButton({
    super.key,
    this.onPressed,
    required this.textButton,
    this.width,
    this.height,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(width ?? 200, height ?? 60),
          backgroundColor: AppColor.accentColor,
          foregroundColor: AppColor.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          )),
      child: isLoading == true
          ? SizedBox(
              width: 25.w,
              height: 25.w,
              child: const CircularProgressIndicator(
                color: AppColor.whiteColor,
                strokeWidth: 2,
              ),
            )
          : Text(
              textButton,
              style: AppStyle.textContent,
            ),
    );
  }
}
