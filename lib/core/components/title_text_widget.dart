import 'package:eco_grow/core/components/text_animated_custom.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  final String title;
  const TitleTextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.getWidth();
    bool isMobile = screenWidth < AppUtils.defineScreenMobile;
    return Column(
      children: [
        TextAnimatedCustom(title,
            style: isMobile ? AppStyle.titleTextWebMobile : AppStyle.titleText),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * (isMobile ? 0.25 : 0.4)),
          child: const Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 2.0,
                  color: AppColor.accentColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.star,
                  color: AppColor.accentColor,
                  size: 24.0,
                ),
              ),
              Expanded(
                child: Divider(
                  thickness: 2.0,
                  color: AppColor.accentColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
