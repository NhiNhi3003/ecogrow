import 'package:eco_grow/core/components/app_button.dart';
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
                        "Create Your Account",
                        style: AppStyle.titleTextWebMobile,
                      ),
                      const SizedBox(height: 30),
                      _buildTextField(
                        controller: _nameController,
                        label: "Full Name",
                        validator: (value) => value == null || value.isEmpty
                            ? 'Please enter your name'
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
                        label: "Password",
                        obscureText: true,
                        validator: ValidationUtils.validatePassword,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _confirmPasswordController,
                        label: "Confirm Password",
                        obscureText: true,
                        validator: (value) => value != _passwordController.text
                            ? 'Passwords do not match'
                            : null,
                      ),

                      const SizedBox(height: 30),
                      AppButton(
                        textButton: 'Sign Up',
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
                          "Already have an account? Login",
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
        _showMessage("Sign Up Successful", "Welcome, $name!");
      } else {
        _showMessage("Sign Up Failed", "Please try again.");
      }
    } catch (e) {
      _toggleLoading(false);
      _showMessage("Error", "An unexpected error occurred.");
    }
  }

  void _showMessage(String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              if (title == 'Sign Up Successful') {
                Navigator.pop(context);
              }
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
