import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class TextAnimatedCustom extends StatelessWidget {
  final String text;
  final TextStyle style;
  const TextAnimatedCustom(
    this.text, {
    super.key,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        ColorizeAnimatedText(
          textAlign: TextAlign.center,
          text,
          textStyle: style,
          colors: AppColor.homTitleTextColorize,
          speed: const Duration(milliseconds: 100),
        ),
      ],
    );
  }
}
