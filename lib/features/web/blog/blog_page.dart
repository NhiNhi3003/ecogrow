import 'package:eco_grow/core/components/responsive/banner_responsive.dart';
import 'package:eco_grow/core/components/responsive/footer_responsive.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/features/web/blog/widgets/blog_responsive.dart';
import 'package:eco_grow/model/story_item.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.getWidth() < AppUtils.defineScreenMobile;
    const String bannerImageUrl =
        'https://cdn.pixabay.com/photo/2024/04/12/19/50/earthday-8692504_1280.png';
    const String bannerTitle =
        'Hãy kể câu chuyện của bạn – Vì mỗi người đều có điều đáng để chia sẻ!';
    final datas = StoryItemModel.stories;
    return ListView(
      children: [
        BannerResponsive(
            isMobileWeb: isMobile,
            bannerImageUrl: bannerImageUrl,
            bannerTitle: bannerTitle),
        GreenStoryResponsive(isMobile: isMobile, datas: datas),
        FooterResponsive(isWebMobile: isMobile)
      ],
    );
  }
}
