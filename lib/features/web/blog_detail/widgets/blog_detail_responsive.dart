import 'package:eco_grow/core/components/app_bar_custom.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/model/story_item.dart';
import 'package:flutter/material.dart';

class BlogDetailResponsive extends StatelessWidget {
  final bool isMobile;
  final StoryItemModel storyItemModel;
  const BlogDetailResponsive(
      {super.key, required this.isMobile, required this.storyItemModel});

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? _buildBlogDetailWebMobile(storyItemModel)
        : _buildBlogDetailWeb(storyItemModel, context);
  }

  Widget _buildBlogDetailWeb(
      StoryItemModel storyItemModel, BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
          horizontal: AppUtils.webPaddingHoriz, vertical: 30.0),
      children: [
        Text(
          textAlign: TextAlign.center,
          storyItemModel.title,
          softWrap: true,
          overflow: TextOverflow.visible,
          style: isMobile ? AppStyle.titleTextWebMobile : AppStyle.titleText,
        ),
        const SizedBox(height: 20.0),
        // First load text-image pairs
        Column(
          children: List.generate(storyItemModel.content.length, (index) {
            return Column(
              children: [
                Image.network(
                  storyItemModel.imagePath[index],
                  width: context.getWidth() * 0.6,
                  height: 500,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(bottom: 7.0),
                  child: Text(
                    storyItemModel.content[index],
                    style: AppStyle.textContent,
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            );
          }),
        ),
        // After all text, load any remaining images
        if (storyItemModel.imagePath.length > storyItemModel.content.length)
          Column(
            children: List.generate(
                storyItemModel.imagePath.length - storyItemModel.content.length,
                (index) {
              return Column(
                children: [
                  Image.network(
                    storyItemModel
                        .imagePath[storyItemModel.content.length + index],
                    width: context.getWidth() * 0.6,
                    height: 500,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20.0),
                ],
              );
            }),
          ),
      ],
    );
  }

  Widget _buildBlogDetailWebMobile(StoryItemModel storyItemModel) {
    return ListView(
      padding: const EdgeInsets.symmetric(
          horizontal: AppUtils.mobilePaddingHoriz, vertical: 30.0),
      children: [
        Text(
          textAlign: TextAlign.center,
          storyItemModel.title,
          softWrap: true,
          overflow: TextOverflow.visible,
          style: isMobile ? AppStyle.titleTextWebMobile : AppStyle.titleText,
        ),
        const SizedBox(height: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(storyItemModel.content.length, (index) {
            return Column(
              children: [
                Image.network(
                  storyItemModel.imagePath[index],
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(bottom: 7.0),
                  child: Text(
                    storyItemModel.content[index],
                    style: AppStyle.textContentMobile,
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            );
          }),
        ),
        if (storyItemModel.imagePath.length > storyItemModel.content.length)
          Column(
            children: List.generate(
                storyItemModel.imagePath.length - storyItemModel.content.length,
                (index) {
              return Column(
                children: [
                  Image.network(
                    storyItemModel
                        .imagePath[storyItemModel.content.length + index],
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20.0),
                ],
              );
            }),
          ),
      ],
    );
  }
}
