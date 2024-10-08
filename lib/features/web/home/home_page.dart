import 'package:eco_grow/core/components/responsive/banner_responsive.dart';
import 'package:eco_grow/core/components/responsive/footer_responsive.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/features/web/home/widgets/live_green_responsive.dart';
import 'package:eco_grow/features/web/home/widgets/vision_responsive.dart';
import 'package:eco_grow/model/about_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String bannerImageUrl =
      'https://cdn.pixabay.com/photo/2024/04/20/11/47/ai-generated-8708404_960_720.jpg';
  static const String bannerTitle =
      '"Cùng EcoGrow Xanh Hóa Thế Giới Từ Những Hạt Giống Nhỏ!"';

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.getWidth() < AppUtils.defineScreenMobile;
    final aboutModels = AboutModel.aboutModels;
    return ListView(
      children: [
        BannerResponsive(
          isMobileWeb: isMobile,
          bannerImageUrl: bannerImageUrl,
          bannerTitle: bannerTitle,
        ),
        const Spacing(size: 20.0),
        VisionResponsive(isMobile: isMobile),
        const Spacing(size: 20.0),
        LiveGreenResponsive(
          isMobile: isMobile,
          datas: aboutModels,
        ),
        FooterResponsive(isWebMobile: isMobile)
      ],
    );
  }
}

class Spacing extends StatelessWidget {
  final double size;
  const Spacing({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}
