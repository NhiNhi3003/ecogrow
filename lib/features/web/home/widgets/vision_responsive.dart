import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/features/web/home/widgets/vision_base_widget.dart';
import 'package:flutter/material.dart';

class VisionResponsive extends StatelessWidget {
  final bool isMobile;
  const VisionResponsive({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return VisionBaseWidget(
      titleStyle: isMobile ? AppStyle.titleTextWebMobile : AppStyle.titleText,
      contentStyle:
          isMobile ? AppStyle.textContentMobile : AppStyle.textContent,
      imageHeight: isMobile ? 200 : 500.0,
      paddingHoriz:
          isMobile ? AppUtils.mobilePaddingHoriz : AppUtils.webPaddingHoriz,
    );
  }
}
