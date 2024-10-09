import 'package:eco_grow/core/components/title_text_widget.dart';
import 'package:eco_grow/features/web/home/home_page.dart';
import 'package:eco_grow/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CropDataBaseWidget extends StatelessWidget {
  final TextStyle titleStyle;
  final TextStyle contentStyle;
  final double imageHeight;
  final double paddingHoriz;

  const CropDataBaseWidget({
    super.key,
    required this.titleStyle,
    required this.contentStyle,
    required this.imageHeight,
    required this.paddingHoriz,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHoriz),
      child: Column(
        children: [
          const TitleTextWidget(title: 'Thống kê số liệu cây trồng'),
          const SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingHoriz),
            child: Text(
              textAlign: TextAlign.justify,
              'Hiện nay, Việt Nam đang thực hiện một chương trình đầy tham vọng nhằm trồng 1 tỷ cây xanh, với mục tiêu hoàn thành vào năm 2025. Chương trình này không chỉ nhằm cải thiện cảnh quan mà còn góp phần vào việc bảo vệ môi trường và ứng phó với biến đổi khí hậu. Từ năm 2021 đến 2023, Việt Nam đã trồng gần 770 triệu cây, đạt khoảng 77% mục tiêu đề ra. Kế hoạch tiếp theo từ năm 2024 đến 2025 dự kiến sẽ trồng thêm 492 triệu cây, bao gồm cả việc trồng cây trong các khu đô thị và khu vực nông thôn .Tỷ lệ che phủ rừng hiện tại đã vượt 42%, với tổng diện tích rừng được chứng nhận vào khoảng 465,000 hecta.',
              style: contentStyle,
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingHoriz),
            child: Image.asset(
              Assets.images.cropData.path,
              height: imageHeight,
              width: double.infinity,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Đây là biểu đồ tròn thể hiện số liệu cây trồng tại Việt Nam và toàn cầu:',
              style: contentStyle,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _customText('•	Cây trồng tại Việt Nam (2021-2023): ',
                      '770 triệu cây'),
                  const Spacing(size: 10),
                  _customText(
                      '•	Cây trồng kế hoạch (2024-2025): ', '492 triệu cây'),
                  const Spacing(size: 10),
                  _customText('•	Cây mất mỗi năm toàn cầu: ', '10 triệu cây'),
                ],
              ),
            ),
          ),
          Text(
            textAlign: TextAlign.justify,
            'Trên quy mô toàn cầu, tình trạng mất rừng vẫn là một vấn đề nghiêm trọng. Hàng năm, khoảng 10 triệu hecta rừng bị mất do nhiều nguyên nhân khác nhau như khai thác gỗ, phát triển nông nghiệp, và đô thị hóa. Đặc biệt, khoảng 95% diện tích mất rừng xảy ra tại các khu vực nhiệt đới, nơi mà sự phát triển kinh tế và nhu cầu tiêu thụ tài nguyên đang gia tăng.',
            style: contentStyle,
          ),
          Text(
            textAlign: TextAlign.justify,
            'Mặc dù một nửa diện tích mất rừng có thể được bù đắp bởi sự phục hồi tự nhiên, nhưng vẫn có nhiều thách thức cần phải giải quyết, bao gồm việc quản lý rừng bền vững và bảo vệ các khu rừng còn lại.',
            style: contentStyle,
          ),
          Text(
            textAlign: TextAlign.justify,
            'Các nỗ lực trồng cây và bảo vệ rừng không chỉ giúp cải thiện môi trường sống mà còn đóng góp vào việc giảm thiểu biến đổi khí hậu. Cây xanh có khả năng hấp thụ carbon dioxide, cải thiện chất lượng không khí, và bảo tồn đa dạng sinh học. Đặc biệt, rừng có vai trò quan trọng trong việc duy trì nguồn nước và ngăn chặn xói mòn đất. Những chương trình trồng cây không chỉ cần được duy trì mà còn phải được mở rộng để tạo ra một tác động lâu dài cho các thế hệ tương lai.',
            style: contentStyle,
          ),
          Text(
            textAlign: TextAlign.justify,
            'Ngoài ra, sự tham gia của cộng đồng trong các hoạt động trồng cây cũng đóng vai trò rất quan trọng. Khi người dân được khuyến khích tham gia và nhận thức rõ về lợi ích của việc trồng cây, họ sẽ có xu hướng bảo vệ môi trường tốt hơn. Việc giáo dục cộng đồng về ý nghĩa của cây xanh và các biện pháp bảo vệ môi trường cần phải được thực hiện thường xuyên để nâng cao nhận thức và trách nhiệm xã hội.',
            style: contentStyle,
          ),
        ],
      ),
    );
  }

  // Hàm tạo custom text
  Widget _customText(String boldText, String normalText) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: boldText,
            style: contentStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: normalText,
            style: contentStyle,
          ),
        ],
      ),
    );
  }
}
