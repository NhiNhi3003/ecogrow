import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/features/mobile/splash/splash_screen.dart';
import 'package:eco_grow/features/web/main/main_page.dart';
import 'package:eco_grow/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Eco Grow',
          debugShowCheckedModeBanner: false,
          theme: _buildAppTheme(),
          home: _buildHomePage(),
        );
      },
    );
  }

  Widget _buildHomePage() {
    return kIsWeb ? const MainPage() : const SplashScreen();
  }

  ThemeData _buildAppTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: AppColor.accentColor,
      textTheme: GoogleFonts.kanitTextTheme(),
    );
  }
}
