import 'package:eco_grow/core/components/app_button.dart';
import 'package:eco_grow/core/components/responsive/banner_responsive.dart';
import 'package:eco_grow/core/components/responsive/footer_responsive.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/features/mobile/splash/splash_screen.dart';
import 'package:eco_grow/features/web/donate/widgets/table_custom.dart';
import 'package:eco_grow/model/donate_model.dart';
import 'package:eco_grow/service/remote/donate_service.dart';
import 'package:flutter/material.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({super.key});

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  DonateService donateService = DonateService();
  List<DonateModel> datas = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    datas = await donateService.getAllDonates();
    // Đảo ngược danh sách
    datas = datas.reversed.toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = context.getWidth() < AppUtils.defineScreenMobile;
    return ListView(
      children: [
        BannerResponsive(
          isMobileWeb: isMobile,
          bannerImageUrl:
              'https://cdn.pixabay.com/photo/2024/09/23/02/20/man-9067410_960_720.jpg',
          bannerTitle:
              "Cùng EcoGrow, xanh hóa thế giới từ những hạt giống nhỏ!",
        ),
        TableCustomResponsive(
          isMobile: isMobile,
          datas: datas,
        ),
        const SizedBox(height: 20.0),
        if (isMobile)
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppUtils.mobilePaddingHoriz),
            child: AppButton(
              textButton: 'Trải nghiệm ủng hộ ngay',
              onPressed: () {
                context.push(
                  screen: const SplashScreen(),
                );
              },
            ),
          ),
        FooterResponsive(isWebMobile: isMobile),
      ],
    );
  }
}
