import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/features/mobile/login/login_screen.dart';
import 'package:eco_grow/features/mobile/main/main_screen.dart';
import 'package:eco_grow/gen/assets.gen.dart';
import 'package:eco_grow/service/local/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SharedPreferencesService prefsService = SharedPreferencesService();

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await prefsService.init();
    String? uid = await prefsService.getUid();
    Future.delayed(const Duration(seconds: 2), () {
      if (uid != null) {
        context.pushAndRemoveUntil(
            screen: const MainScreen(), type: PageTransitionType.rightToLeft);
      } else {
        context.pushAndRemoveUntil(
            screen: const LoginScreen(), milliseconds: 2000);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: Hero(
          tag: 'logoHero',
          child: Image.asset(
            Assets.icons.logo.path,
            width: 100.w,
          ),
        ),
      ),
    );
  }
}
