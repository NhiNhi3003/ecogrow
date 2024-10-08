import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class BannerResponsive extends StatelessWidget {
  final bool isMobileWeb;
  final String bannerImageUrl;
  final String bannerTitle;

  const BannerResponsive({
    super.key,
    required this.isMobileWeb,
    required this.bannerImageUrl,
    required this.bannerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return isMobileWeb
        ? _buildBannerWebMobile(context, bannerImageUrl, bannerTitle)
        : _buildBannerWeb(context, bannerImageUrl, bannerTitle);
  }

  Widget _buildBannerWebMobile(
      BuildContext context, String backgroundImage, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      width: context.getHeight(),
      height: 200.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            color: Colors.black.withOpacity(0.2),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    title,
                    textAlign: TextAlign.center,
                    textStyle: AppStyle.bannerTextWebMobile,
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                totalRepeatCount: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerWeb(
      BuildContext context, String backgroundImage, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50.0),
      width: context.getHeight(),
      height: 400.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            color: Colors.black.withOpacity(0.2),
          ),
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Center(
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    title,
                    textAlign: TextAlign.center,
                    textStyle: AppStyle.bannerText,
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                totalRepeatCount: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
