import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoGrow',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AboutPage(),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About EcoGrow'),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title section
              Text(
                'EcoGrow: About Me',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900],
                ),
              ),
              SizedBox(height: 20),

              // Vision Section
              buildSectionTitle('Tầm nhìn (Vision)'),
              SizedBox(height: 10),
              buildSectionContent(
                  'EcoGrow hướng tới việc trở thành một dự án tiên phong trong việc tái tạo không gian xanh và bảo vệ môi trường tại Việt Nam, góp phần cải thiện chất lượng không khí, chống biến đổi khí hậu và xây dựng một thế giới bền vững. Chúng tôi mơ ước về một tương lai nơi mà các thành phố Việt Nam không chỉ phát triển hiện đại mà còn xanh tươi, sạch đẹp, với hàng triệu cây xanh được trồng, phủ xanh khắp mọi miền đất nước. Mục tiêu cuối cùng của chúng tôi là tạo ra một thế giới mà con người sống hài hòa với thiên nhiên, nơi mỗi hành động nhỏ đều đóng góp vào việc bảo vệ hành tinh cho các thế hệ tương lai.'),
              SizedBox(height: 20),

              // Mission Section
              buildSectionTitle('Sứ mệnh (Mission)'),
              SizedBox(height: 10),
              buildSectionContent(
                  'Sứ mệnh của EcoGrow là truyền cảm hứng và kết nối cộng đồng trong việc trồng cây và sống xanh. Chúng tôi kêu gọi mọi người cùng chung tay bảo vệ môi trường bằng cách đóng góp vào các dự án trồng cây, giáo dục và nâng cao nhận thức về lối sống bền vững. Thông qua các hoạt động thiết thực, EcoGrow không chỉ trồng cây mà còn trồng niềm tin và hy vọng vào một tương lai xanh. Chúng tôi cam kết mang lại sự thay đổi tích cực cho môi trường sống, đồng thời tạo ra một cộng đồng có trách nhiệm với hành tinh và khuyến khích mọi người hành động vì môi trường từ những việc nhỏ nhất.'),
              SizedBox(height: 20),

              // FAQ Section
              buildSectionTitle('Câu hỏi thường gặp (FAQ)'),
              SizedBox(height: 10),
              buildFAQItem('Tôi có thể quyên góp bao nhiêu?',
                  'Tuỳ vào điều kiện tài chính mà các bạn có thể đưa ra số tiền phù hợp với khả năng của mình. Mục tiêu của chúng mình là tích tiểu thành đại nên cho dù là vài trăm đồng chúng mình cũng rất vui vì bạn đã quyên góp.'),
              buildFAQItem('EcoGrow sẽ trồng cây ở khu vực nào?',
                  'Chúng mình sẽ ưu tiên những nơi có mật độ cây cối thưa thớt ở địa bàn TP BR, ven đường lớn và ở những khu đất trống có thể trồng trọt.'),
              buildFAQItem('Làm thế nào để theo dõi dự án trồng cây?',
                  'EcoGrow sẽ cố gắng cập nhật sớm và liên tục những tiến triển của cây cối vì đây cũng là một trong những tiêu chí mà EcoGrow được quan tâm bậc nhất.'),
              buildFAQItem('Quyên góp có đảm bảo minh bạch không?',
                  'Vì bản thân mình chưa đủ khả năng để kiểm soát tài chính cũng như đứng tên một tài khoản nhận quyên góp, chính vì thế EcoGrow đã liên hệ xin phép Phòng Kinh tế của TP BR để xin một stk của cơ quan chuyên về những vấn đề như trồng cây gây rừng, bảo vệ môi trường, thế nên sự minh bạch của dự án là 100%.'),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build section title
  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.green[800],
      ),
    );
  }

  // Helper function to build section content
  Widget buildSectionContent(String content) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 16,
        height: 1.5,
        color: Colors.black87,
      ),
    );
  }

  // Helper function to build FAQ items
  Widget buildFAQItem(String question, String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green[700],
            ),
          ),
          SizedBox(height: 5),
          Text(
            answer,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
