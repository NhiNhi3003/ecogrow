import 'package:eco_grow/core/components/app_button.dart';
import 'package:eco_grow/core/components/text_animated_custom.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/features/mobile/login/sigup_screen.dart';
import 'package:eco_grow/features/mobile/main/main_screen.dart';
import 'package:eco_grow/gen/assets.gen.dart';
import 'package:eco_grow/service/local/shared_preferences_service.dart';
import 'package:eco_grow/service/remote/auth_service.dart';
import 'package:eco_grow/utils/validation_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService authService =
      AuthService(); // Create an instance of AuthService
  final SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  bool isLoading = false; // To manage loading state

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Hide the keyboard on tap outside
      },
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: 'logoHero',
                        child: Image.asset(
                          Assets.icons.logo.path,
                          width: 120.w,
                          height: 120.h,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Welcome message with animated text
                      const TextAnimatedCustom(
                        "Welcome to EcoGrow!",
                        style: AppStyle.titleTextWebMobile,
                      ),
                      const SizedBox(height: 30),
                      // Email input
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontSize: 16.sp,
                            color: AppColor.accentColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        validator: (value) =>
                            ValidationUtils.validateEmail(value),
                      ),
                      const SizedBox(height: 20),

                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: 16.sp,
                            color: AppColor.accentColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        validator: (value) =>
                            ValidationUtils.validatePassword(value),
                      ),
                      const SizedBox(height: 30),
                      // Login button
                      AppButton(
                        textButton: isLoading ? 'Logging in...' : 'Login',
                        width: double.infinity,
                        height: 55.h,
                        isLoading: isLoading,
                        onPressed: isLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  _login();
                                }
                              },
                      ),
                      const SizedBox(height: 20),
                      // Navigate to Sign-up screen
                      GestureDetector(
                        onTap: () {
                          context.pushRtl(screen: const SignUpScreen());
                        },
                        child: Text(
                          "Don't have an account? Sign up",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    setState(() {
      isLoading = true;
    });
    try {
      User? user = await authService.signInWithEmail(email, password);
      setState(() {
        isLoading = false;
      });
      if (user != null) {
        context.pushAndRemoveUntil(
            screen: const MainScreen(), type: PageTransitionType.rightToLeft);
        sharedPreferencesService.setUid(user.uid);
      } else {
        _showDialog("Error", "An unexpected error occurred. Please try again.");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      _showDialog("Error", "An unexpected error occurred. Please try again.");
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
