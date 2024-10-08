import 'package:eco_grow/core/components/costom_expaned_text.dart';
import 'package:eco_grow/core/components/custom_grid_view.dart';
import 'package:eco_grow/core/components/title_text_widget.dart';
import 'package:eco_grow/core/components/responsive/banner_responsive.dart';
import 'package:eco_grow/core/components/responsive/footer_responsive.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/model/core_value_model.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.getWidth() < AppUtils.defineScreenMobile;
    final coreValues = CoreValueModel.coreValue;
    const backgroundImage =
        'https://cdn.pixabay.com/photo/2022/10/23/13/43/canoe-7541311_1280.jpg';
    const title = 'Về chúng tôi';
    final expansionTileData = [
      {
        'title': 'Tôi có thể quyên góp bao nhiêu?',
        'content':
            'Tuỳ vào điều kiện tài chính mà các bạn có thể đưa ra số tiền phù hợp với khả năng của mình. Mục tiêu của chúng mình là tích tiểu thành đại nên cho dù là vài trăm đồng chúng mình cũng rất vui vì bạn đã quyên góp.'
      },
      {
        'title': 'EcoGrow sẽ trồng cây ở khu vực nào?',
        'content':
            'Chúng mình sẽ ưu tiên những nơi có mật độ cây cối thưa thớt ở địa bàn TP BR, ven đường lớn và ở những khu đất trống có thể trồng trọt.'
      },
      {
        'title': 'Làm thế nào để theo dõi dự án trồng cây?',
        'content':
            'EcoGrow sẽ cố gắng cập nhật sớm và liên tục những tiến triển của cây cối vì đây cũng là một trong những tiêu chí mà EcoGrow được quan tâm bậc nhất.'
      },
      {
        'title': 'Quyên góp có đảm bảo minh bạch không?',
        'content':
            'Vì bản thân mình chưa đủ khả năng để kiểm soát tài chính cũng như đứng tên một tài khoản nhân quyên góp, chính vì thế EcoGrow đã liên hệ xin phép Phòng Kinh tế của TP BR để xin một stk của cơ quan chuyên về những vấn đề như trồng cây gây rừng, bảo vệ môi trường, thế nên sự minh bạch của dự án là 100%.'
      },
    ];
    return Stack(
      children: [
        ListView(
          children: [
            BannerResponsive(
                isMobileWeb: isMobile,
                bannerImageUrl: backgroundImage,
                bannerTitle: title),
            const SizedBox(height: 30.0),
            const TitleTextWidget(title: 'Giá trị cốt lõi của EcoGrow'),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: isMobile
                      ? AppUtils.mobilePaddingHoriz
                      : context.getWidth() * 0.15,
                  vertical: isMobile ? 10.0 : 20.0),
              child: CustomAppGridView(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        boxShadow: AppColor.appBoxShaDowns,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            Text(
                              coreValues[index].title,
                              style: AppStyle.titleTextWebMobile,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              coreValues[index].content,
                              style: isMobile
                                  ? AppStyle.textContentMobile
                                  : AppStyle.textContent,
                              textAlign: TextAlign.justify,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  maxCrossAxisExtent: 700,
                  childAspectRatio: isMobile ? 0.6 : 1),
            ),
            ...expansionTileData.map((data) {
              return CustomExpansionTile(
                horizontalPadding: isMobile
                    ? AppUtils.mobilePaddingHoriz
                    : context.getWidth() * 0.15,
                title: data['title']!,
                content: data['content']!,
              );
            }),
            FooterResponsive(isWebMobile: isMobile)
          ],
        ),
      ],
    );
  }
}
