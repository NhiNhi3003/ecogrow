import 'package:eco_grow/core/components/custom_grid_view.dart';
import 'package:eco_grow/core/components/title_text_widget.dart';
import 'package:eco_grow/core/components/app_button.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/features/web/blog_detail/blog_detail.dart';
import 'package:eco_grow/model/story_item.dart';
import 'package:flutter/material.dart';

class GreenStoryResponsive extends StatelessWidget {
  final List<StoryItemModel> datas;
  final bool isMobile;

  const GreenStoryResponsive(
      {super.key, required this.datas, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    void onPressedDetail(StoryItemModel storyItemModel) {
      context.push(screen: BlogDetail(storyItemModel: storyItemModel));
    }

    List<StoryItemModel> communityDatas =
        datas.where((element) => element.isCommunity == true).toList();
    List<StoryItemModel> personalDatas =
        datas.where((element) => element.isCommunity == false).toList();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            isMobile ? AppUtils.mobilePaddingHoriz : AppUtils.webPaddingHoriz,
      ).copyWith(bottom: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 30.0),
          const TitleTextWidget(title: 'Câu chuyện cá nhân'),
          _buildStoryGrid(personalDatas, onPressedDetail, isMobile),
          const SizedBox(height: 30.0),
          const TitleTextWidget(title: 'Câu chuyện cộng đồng'),
          _buildStoryGrid(communityDatas, onPressedDetail, isMobile),
        ],
      ),
    );
  }

  Widget _buildStoryGrid(List<StoryItemModel> storyDatas,
      void Function(StoryItemModel) onPressed, bool isMobile) {
    return CustomAppGridView(
      itemCount: storyDatas.length,
      maxCrossAxisExtent: isMobile ? double.infinity : 400.0,
      childAspectRatio: isMobile ? 1 : 0.8,
      itemBuilder: (context, index) {
        return _buildStoryItem(storyDatas[index], onPressed, isMobile);
      },
    );
  }

  Widget _buildStoryItem(StoryItemModel data,
      void Function(StoryItemModel) onPressed, bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: AppColor.appBoxShaDowns,
        color: AppColor.whiteColor,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Image.network(
                data.imagePath.first,
                width: double.infinity,
                height: isMobile
                    ? constraints.maxHeight * 0.6
                    : constraints.maxHeight * 0.6,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 10.0 : 20.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title,
                        maxLines: isMobile ? 3 : 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.textContent.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: AppButton(
                          textButton: 'Xem Ngay',
                          onPressed: () => onPressed(data),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
