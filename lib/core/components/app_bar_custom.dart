import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:flutter/material.dart';

class AppbarCustom extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final String logoImg;
  const AppbarCustom({super.key, required this.actions, required this.logoImg});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.getWidth();
    final screenHeight = context.getHeight();
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.01, horizontal: screenWidth * 0.03),
      width: context.getWidth(),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        boxShadow: [
          BoxShadow(
              color: AppColor.blackColor.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 2,
              spreadRadius: 1)
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            logoImg,
            width: 60.0,
            height: 60.0,
            fit: BoxFit.cover,
          ),
          const Spacer(),
          ...actions
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80.0);
}
