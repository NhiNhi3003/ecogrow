import 'package:eco_grow/core/components/title_text_widget.dart';
import 'package:eco_grow/features/web/home/widgets/live_green.dart';
import 'package:eco_grow/model/about_model.dart';
import 'package:flutter/material.dart';

class LiveGreenResponsive extends StatelessWidget {
  final bool isMobile;
  final List<AboutModel> datas;

  const LiveGreenResponsive({
    super.key,
    required this.isMobile,
    required this.datas,
  });

  @override
  Widget build(BuildContext context) {
    return _buildAboutContent(context);
  }

  Widget _buildAboutContent(BuildContext context) {
    return Column(
      children: [
        const TitleTextWidget(title: 'Sống Xanh'),
        const SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: datas.length,
          itemBuilder: (context, index) {
            final data = datas[index];
            return LiveGreenWidget(
              data: data,
              isOdd: index.isOdd,
              isMobile: isMobile,
            );
          },
        ),
      ],
    );
  }
}
