class StoryItemModel {
  final String title;
  final List<String> content;
  final List<String> imagePath;
  final bool isCommunity;
  StoryItemModel(
      {required this.isCommunity,
      required this.title,
      required this.content,
      required this.imagePath});

  static List<StoryItemModel> stories = [
    StoryItemModel(
        isCommunity: true,
        title: 'Câu chuyện từ Singapore',
        content: [
          'Singapore – một quốc gia nhỏ bé nhưng lại nổi tiếng trên toàn thế giới với hệ thống không gian xanh mát mắt và bầu không khí trong lành. Thành phố này đã trở thành một ví dụ điển hình về sự cân bằng giữa phát triển đô thị và bảo vệ thiên nhiên. Khi tôi vô tình lướt thấy trang mạng của **Singapore Explore**, hình ảnh về những công viên xanh mướt, những con đường rợp bóng cây đã để lại ấn tượng mạnh trong tôi. Đây không chỉ là một quốc gia phát triển về kinh tế, mà còn là một nơi mà mỗi công dân đều có ý thức bảo vệ môi trường.',
          'Những hình ảnh về những hàng cây dọc khắp các con đường, những vườn thẳng đứng trên các tòa nhà cao tầng và những công viên giữa lòng thành phố mang đến cảm giác như Singapore là một “thành phố trong rừng”. Chính phủ Singapore đã đầu tư mạnh mẽ vào việc phát triển không gian xanh, từ việc trồng cây đến việc quy hoạch thành phố sao cho hài hòa với thiên nhiên. Các sáng kiến như “Garden City” và “City in a Garden” đã biến Singapore trở thành một biểu tượng của sự phát triển bền vững.',
          'Câu chuyện này khiến tôi luôn ước ao một ngày nào đó, Việt Nam của chúng ta cũng sẽ có những không gian xanh tương tự. Nhìn vào thành công của Singapore, tôi tin rằng nếu có sự đồng lòng từ cộng đồng và chính phủ, chúng ta hoàn toàn có thể tạo nên những đô thị xanh hơn, nơi mà con người sống hòa hợp với thiên nhiên. Đây cũng chính là động lực lớn để tôi sáng lập **EcoGrow**, một dự án không chỉ nhằm cải thiện môi trường, mà còn là cầu nối để chúng ta cùng nhau xây dựng một Việt Nam xanh tươi, đáng sống.',
        ],
        imagePath: [
          'https://i.natgeofe.com/n/d3eb75f2-1cfb-4934-8def-8ff7a39985b8/1-urban-innovator-singapore-AP_17028110123351.jpg?w=1280&h=1024',
          'https://i0.wp.com/singaporeglobalnetwork.gov.sg/wp-content/uploads/2023/09/hero-6reasonswhysg.jpg?w=1200&ssl=1',
          'https://i0.wp.com/singaporeglobalnetwork.gov.sg/wp-content/uploads/2023/09/6reasonswhysg-2bjpeg.jpg?w=1140&ssl=1'
        ]),
    StoryItemModel(
      isCommunity: true,
      title: 'Câu chuyện về Làng Xanh ở Cẩm Hải, Quảng Bình',
      content: [
        'Tại xã Cẩm Hải, tỉnh Quảng Bình, một dự án cộng đồng đã thành công trong việc cải thiện môi trường sống bằng cách trồng cây xanh. Trước đây, đất đai tại khu vực này bị xói mòn nghiêm trọng, ảnh hưởng không nhỏ đến đời sống và nông nghiệp của người dân. Nhưng nhờ vào sự đồng lòng của người dân, cùng với sự hỗ trợ từ chính quyền, một dự án trồng cây đã được khởi động.',
        'Người dân đã trồng các loại cây keo, bạch đàn và nhiều loại cây bản địa khác, giúp giảm thiểu tình trạng xói mòn đất và mang lại sự ổn định cho đời sống sản xuất. Sau vài năm, cây cối phát triển xanh tốt, không chỉ giúp cải thiện đất đai mà còn tạo ra một không gian sống xanh mát, trong lành. Dự án này không chỉ phục hồi môi trường mà còn tạo công ăn việc làm và thu nhập ổn định cho người dân địa phương. Đây là một ví dụ tuyệt vời về sức mạnh của cộng đồng trong việc bảo vệ và tái tạo môi trường.',
      ],
      imagePath: [
        'https://vcdn1-dulich.vnecdn.net/2022/06/14/Dung4-1655204284.jpg?w=460&h=0&q=100&dpr=2&fit=crop&s=G_vWmEFjdyuOIM4v7r8Hcg',
        'https://vcdn1-dulich.vnecdn.net/2022/06/14/Dung7-1655204285.jpg?w=460&h=0&q=100&dpr=2&fit=crop&s=s143hQ54aIkAVBvE3k8qKQ',
        'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2022/6/8/1054441/Ny1mmeli.jpeg'
      ],
    ),
    StoryItemModel(
      isCommunity: true,
      title: 'Câu chuyện tại TP.HCM',
      content: [
        'Tại TP.HCM, một dự án trồng cây xanh đã được thực hiện trên quy mô lớn nhằm giảm thiểu ô nhiễm không khí và tạo không gian xanh cho thành phố. Để thực hiện dự án này, hàng ngàn người dân, bao gồm cả học sinh, sinh viên và các tổ chức xã hội, đã chung tay tham gia chiến dịch trồng cây dọc theo các con đường chính và trong công viên.',
        'Kết quả, hàng ngàn cây xanh đã được trồng, giúp giảm hiệu ứng đảo nhiệt đô thị, cung cấp bóng mát và cải thiện chất lượng không khí. Nhiều người dân TP.HCM chia sẻ rằng việc có thêm không gian xanh đã giúp cải thiện sức khỏe tinh thần của họ, đặc biệt là trong bối cảnh đô thị hóa nhanh chóng khiến thành phố ngày càng chật chội và nóng bức. Câu chuyện tại TP.HCM là minh chứng rõ ràng cho thấy việc trồng cây không chỉ làm đẹp cảnh quan mà còn có tác động tích cực đến cuộc sống của người dân.',
        'Những câu chuyện truyền cảm hứng từ Singapore, Cẩm Hải và TP.HCM đều cho thấy sức mạnh của sự đồng lòng và hành động tập thể trong việc cải thiện môi trường. Trồng cây không chỉ là việc làm bảo vệ thiên nhiên, mà còn là cách chúng ta xây dựng một tương lai xanh bền vững cho các thế hệ sau.',
      ],
      imagePath: [
        'https://file1.dangcongsan.vn/data/0/images/2024/02/28/upload_49/tphcm.jpg?dpi=150&quality=100&w=800',
          'https://images.pexels.com/photos/980221/pexels-photo-980221.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://file.hstatic.net/1000257344/article/hinh-anh-con-duong-dep-nhat-thanh-pho-ho-chi-minh__1__53cbbb548e614c119324f7b745d25d8f_master.jpg',
      ],
    ),
    StoryItemModel(
      isCommunity: false,
      title: 'Câu chuyện truyền cảm hứng từ bản thân',
      content: [
        'Tôi chưa bao giờ nghĩ rằng việc trồng cây lại có thể mang lại nhiều niềm vui và sự kết nối đến thế cho cuộc sống của mình. Một ngày nọ, khi nhận ra rằng không gian quanh nhà có thể trở thành một khu vườn nhỏ xinh xắn, tôi bắt đầu thử trồng vài cây rau gia vị. Từ những cây rau ngót, ớt cho đến các loại cây ăn quả như chanh, ổi, khu vườn nhỏ của tôi dần trở nên xanh mướt.'
            'Mỗi buổi sáng, khi ngắm nhìn những chiếc lá non vừa nở, tôi cảm nhận được sự thanh bình và hạnh phúc. Cây cối không chỉ giúp tôi tạo ra không gian thư giãn mà còn là nguồn thực phẩm tự nhiên, sạch sẽ và an toàn cho cả gia đình. Câu chuyện này thôi thúc tôi muốn chia sẻ niềm vui trồng cây với mọi người, và đó cũng là lý do **EcoGrow** ra đời. Tôi tin rằng chỉ cần mỗi người trồng một cây, cùng nhau, chúng ta sẽ thay đổi thế giới.'
      ],
      imagePath: [
        'https://cdn.tuoitre.vn/zoom/700_390/471584752817336320/2024/3/27/trong-cay-1711521831288259852440-47-0-885-1600-crop-1711522194984293900237.png',
        'https://lh6.googleusercontent.com/proxy/RPJIuWxmxOKrTd60kZBFypcdgk4Rp8QPeugPbJMRWn1XBLE7sKYcnBZI7mhPqBMztRzTIWCtKnd9SGEM0Cmii3r-sIPhYLrdvoqMS7SlHt9Tj7-nGY8ujvgdaM3lWmE2oNKYoR0',
        'https://danviet.mediacdn.vn/296231569849192448/2022/3/30/tuoi-nuoc-sang-hay-toi-cho-cay-canh-16486361705331672633387.jpg',
      ],
    )
  ];
}
