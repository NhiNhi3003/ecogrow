class AboutModel {
  final String title;
  final List<String> content;
  final String? image;

  AboutModel({required this.title, required this.content, this.image});

  static List<AboutModel> aboutModels = [
    AboutModel(
        title: 'Sống xanh là gì?',
        content: [
          'Sống xanh không chỉ là việc giảm thiểu lượng rác thải hàng ngày hay sử dụng túi vải thay thế túi nilon, mà là một lối sống bền vững, thân thiện với môi trường. Sống xanh chính là biết bảo vệ thiên nhiên từ những hành động nhỏ nhất, như sử dụng năng lượng tái tạo, giảm thiểu tiêu thụ nhiên liệu hóa thạch, và giảm thiểu lãng phí tài nguyên thiên nhiên.',
          'Một người sống xanh thường có thói quen tiêu dùng thông minh, luôn ưu tiên các sản phẩm tái chế và hạn chế sử dụng sản phẩm dùng một lần. Họ không chỉ tìm cách tiết kiệm năng lượng mà còn ưu tiên các nguồn năng lượng sạch như mặt trời, gió và nước. Trong việc di chuyển, họ chọn xe đạp, xe điện hoặc phương tiện công cộng thay vì xe cá nhân để giảm phát thải khí carbon.',
          'Sống xanh không phải là điều quá lớn lao hay phức tạp. Đôi khi chỉ là bạn dừng lại một chút để suy nghĩ về những việc mình làm hàng ngày: Liệu có cần thiết sử dụng túi nilon khi đi siêu thị? Liệu có thể tắt đèn khi không sử dụng? Những hành động nhỏ ấy, khi gộp lại từ hàng triệu người, sẽ tạo ra một sự thay đổi lớn cho hành tinh của chúng ta.'
        ],
        image:
            'https://cafefcdn.com/2020/4/26/photo-1-1587889708107738085732.png'),
    AboutModel(
        title: 'Lý do nên sống xanh',
        content: [
          'Chúng ta sống trên một hành tinh có giới hạn về tài nguyên, và lối sống tiêu thụ quá mức của con người đang làm cho Trái Đất ngày càng cạn kiệt. Việc chuyển đổi sang lối sống xanh không chỉ giúp bảo vệ môi trường mà còn đem lại nhiều lợi ích đáng kể cho cá nhân và xã hội. Dưới đây là những lý do bạn nên sống xanh ngay từ hôm nay',
          '- Tiết kiệm tài chính: Khi bạn giảm thiểu việc sử dụng đồ nhựa dùng một lần hay điện năng, bạn sẽ tiết kiệm được một khoản chi phí không nhỏ. Đồng thời, việc trồng cây xanh hay sản xuất thực phẩm hữu cơ tại nhà cũng giúp giảm đáng kể chi phí mua sắm.',
          '-Cải thiện sức khỏe: Một môi trường trong lành, ít ô nhiễm, với nhiều cây xanh và thực phẩm sạch, không chỉ giúp bạn và gia đình có một cuộc sống lành mạnh hơn mà còn hạn chế nguy cơ mắc các bệnh do ô nhiễm môi trường gây ra.'
              '- Phát triển kinh tế bền vững: Hỗ trợ các sản phẩm thân thiện với môi trường cũng là cách bạn góp phần vào sự phát triển của các doanh nghiệp xanh, thúc đẩy nền kinh tế bền vững. Những doanh nghiệp này tạo ra sản phẩm từ nguyên liệu tự nhiên, không gây hại cho môi trường, giúp bảo vệ Trái Đất và tương lai của chúng ta.',
        ],
        image:
            'https://bcp.cdnchinhphu.vn/334894974524682240/2024/2/7/dat-gi-trong-cay-tot-nhat-1-17072389403411539358458.jpg'),
    AboutModel(
        title: 'Những điều cần làm khi sống xanh',
        content: [
          'Nếu bạn muốn bắt đầu hành trình sống xanh của mình nhưng không biết phải làm gì, hãy tham khảo một số hành động dưới đây:',
          '- Giảm rác thải nhựa: Hãy mang theo túi vải khi đi mua sắm, sử dụng bình nước tái sử dụng thay vì mua nước đóng chai, và chọn những sản phẩm có bao bì thân thiện với môi trường.',
          '- Trồng cây: Đây là cách đơn giản và hiệu quả nhất để đóng góp vào việc bảo vệ môi trường. Bạn có thể bắt đầu từ việc trồng cây nhỏ trong sân vườn, trên ban công, hoặc tham gia vào các dự án trồng cây của cộng đồng.',
          '- Tiết kiệm năng lượng: Sử dụng bóng đèn tiết kiệm điện, tận dụng ánh sáng tự nhiên, và tắt các thiết bị khi không sử dụng.',
          '- Ủng hộ các sản phẩm hữu cơ và thân thiện với môi trường: Mua thực phẩm từ các nguồn hữu cơ, ủng hộ sản phẩm có chứng nhận thân thiện với môi trường để giảm thiểu tác động của hóa chất độc hại lên thiên nhiên.',
          '- Sử dụng phương tiện công cộng: Thay vì lái xe cá nhân, hãy sử dụng xe buýt, tàu điện hoặc xe đạp để giảm lượng khí thải carbon.'
        ],
        image:
            'https://thanhnien.mediacdn.vn/uploaded/dieutrang.qc/2019_09_05/omo/omo-1_PRGI.jpg?width=500'),
    AboutModel(
        title: 'Thế giới sẽ ra sao nếu thiếu cây cối?',
        content: [
          'Hãy thử tưởng tượng một thế giới không có cây cối. Sẽ ra sao khi những cánh rừng bạt ngàn biến mất, để lại những vùng đất khô cằn? Không còn bóng mát, không còn tiếng chim hót, không còn hệ sinh thái đa dạng mà chúng ta từng biết. Môi trường sống của con người và động vật sẽ bị hủy hoại. Không có cây cối, không có sự cân bằng về khí hậu, nhiệt độ toàn cầu sẽ tăng lên, gây ra những thảm họa như lũ lụt, hạn hán và bão tố.',
          'Cây xanh là lá phổi của Trái Đất. Chúng hấp thụ CO2 và tạo ra oxy, giúp điều hòa không khí, duy trì nhiệt độ ổn định và giữ cho đất không bị xói mòn. Nếu không có cây cối, không khí sẽ trở nên độc hại hơn, chất lượng cuộc sống giảm sút và con người sẽ đối mặt với hàng loạt vấn đề nghiêm trọng về sức khỏe và môi trường.',
        ],
        image:
            'https://thanhnien.mediacdn.vn/uploaded/dieutrang.qc/2019_09_05/omo/omo-1_PRGI.jpg?width=500'),
    AboutModel(
        title: 'Vì sao cần phải chung tay quyên góp cho cây xanh?',
        content: [
          'Việc trồng cây không chỉ cần ý thức và sự cam kết, mà còn đòi hỏi sự hỗ trợ tài chính để có thể duy trì và mở rộng các dự án trồng rừng. Mỗi một cây xanh được trồng không chỉ là một biểu tượng của sự sống mà còn là một nguồn lực để bảo vệ môi trường. Tuy nhiên, để trồng và duy trì hệ sinh thái cây xanh, chúng ta cần có nguồn vốn đủ mạnh để chi trả cho các công việc như chăm sóc, tưới tiêu, bảo vệ cây khỏi sâu bệnh và thiên tai.',
          'Bằng cách quyên góp cho EcoGrow, bạn đang giúp tạo ra một tương lai xanh hơn cho chính mình và thế hệ tương lai. **Cùng EcoGrow, xanh hóa thế giới từ những hạt giống nhỏ!**. Chúng ta không chỉ đóng góp tiền bạc, mà còn đầu tư cho cuộc sống lành mạnh, bền vững và hy vọng vào một Trái Đất tràn đầy sức sống.'
        ],
        image:
            'https://lh6.googleusercontent.com/proxy/XOjjZYjhqz5OBxkm1lmbmF26Uu23ul2IqWNSvzilb97u3w5Qu5CobiLnV_-60LvBNhJ6OJmbNh5BZbg0sU9v0P5YlVlcDFwunlx_')
  ];
}
