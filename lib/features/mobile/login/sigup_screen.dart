import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:eco_grow/core/components/app_button.dart';
import 'package:eco_grow/core/components/app_dialog.dart';
import 'package:eco_grow/core/components/text_animated_custom.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/gen/assets.gen.dart';
import 'package:eco_grow/service/remote/auth_service.dart';
import 'package:eco_grow/utils/validation_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus(); // Hide the keyboard when tapped outside
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
                      const TextAnimatedCustom(
                        "Đăng ký tài khoản",
                        style: AppStyle.titleTextWebMobile,
                      ),
                      const SizedBox(height: 30),
                      _buildTextField(
                        controller: _nameController,
                        label: "Họ và tên",
                        validator: (value) => value == null || value.isEmpty
                            ? 'Vui lòng nhập tên'
                            : null,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _emailController,
                        label: "Email",
                        keyboardType: TextInputType.emailAddress,
                        validator: ValidationUtils.validateEmail,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _passwordController,
                        label: "Mật khẩu",
                        obscureText: true,
                        validator: ValidationUtils.validatePassword,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _confirmPasswordController,
                        label: "Xác nhận mật khẩu",
                        obscureText: true,
                        validator: (value) => value != _passwordController.text
                            ? 'Mật khẩu không khớp'
                            : null,
                      ),

                      const SizedBox(height: 30),
                      AppButton(
                        textButton: 'Đăng ký',
                        width: double.infinity,
                        height: 55.h,
                        isLoading: isLoading,
                        onPressed: isLoading
                            ? null // Disable button while loading
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  _signUp();
                                }
                              },
                      ),

                      const SizedBox(height: 20),

                      // Navigation to login
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Đã có tài khoản? Đăng nhập",
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 16.sp,
          color: AppColor.accentColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      validator: validator,
    );
  }

  void _toggleLoading(bool state) {
    setState(() {
      isLoading = state;
    });
  }

  Future<void> _signUp() async {
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    _toggleLoading(true);

    try {
      User? user = await authService.signUpWithEmail(email, password, name);
      _toggleLoading(false);

      if (user != null) {
        AppDialog.successDialog(
          desc: 'Chúc mừng bạn đã đăng ký thành công tài khoản!',
          context,
          btnOkOnPress: () {
            Navigator.pop(context);
          },
        ).show();
      } else {
        AppDialog.errorDialog(
          desc: 'Email đã tồn tại trong hệ thống!',
          context,
          btnOkOnPress: () {},
        ).show();
      }
    } catch (e) {
      _toggleLoading(false);
      AppDialog.successDialog(
        desc:
            'Lỗi không xác định, vui lòng liên hệ +123 456 789 đễ được hỗ trợ!',
        context,
        btnOkOnPress: () {
          Navigator.pop(context);
        },
      ).show();
    }
  }
}
