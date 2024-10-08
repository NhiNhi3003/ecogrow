import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:flutter/material.dart';

class FooterResponsive extends StatelessWidget {
  final bool isWebMobile;
  const FooterResponsive({super.key, required this.isWebMobile});

  @override
  Widget build(BuildContext context) {
    return isWebMobile
        ? _buildFooterWebMobile(context)
        : _buildFooterWeb(context);
  }
}

Widget _buildFooterWeb(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 50),
    width: context.getWidth(),
    color: AppColor.accentColor,
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCompanyInfo(),
            _buildFooterLinks(),
            _buildContactInfo(),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(color: Colors.white54),
        const SizedBox(height: 10),
        const Center(
          child: Text(
            '© 2024 Eco Grow. All rights reserved.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

Widget _buildFooterWebMobile(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    width: context.getWidth(),
    color: AppColor.accentColor,
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCompanyInfo(),
        const SizedBox(height: 20),
        _buildFooterLinks(),
        const SizedBox(height: 20),
        _buildContactInfo(),
        const SizedBox(height: 20),
        const Divider(color: Colors.white54),
        const SizedBox(height: 10),
        const Center(
          child: Text(
            '© 2024 Eco Grow. All rights reserved.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

Widget _buildCompanyInfo() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Eco Grow',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      SizedBox(height: 10),
      Text(
        'Leading sustainable growth solutions.',
        style: TextStyle(color: Colors.white70),
      ),
    ],
  );
}

Widget _buildFooterLinks() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Quick Links',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 10),
      GestureDetector(
        onTap: () {}, // Add navigation logic
        child: const Text('Home', style: TextStyle(color: Colors.white70)),
      ),
      const SizedBox(height: 5),
      GestureDetector(
        onTap: () {}, // Add navigation logic
        child: const Text('About Us', style: TextStyle(color: Colors.white70)),
      ),
      const SizedBox(height: 5),
      GestureDetector(
        onTap: () {}, // Add navigation logic
        child: const Text('Services', style: TextStyle(color: Colors.white70)),
      ),
      const SizedBox(height: 5),
      GestureDetector(
        onTap: () {}, // Add navigation logic
        child: const Text('Contact', style: TextStyle(color: Colors.white70)),
      ),
    ],
  );
}

Widget _buildContactInfo() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Contact Us',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      SizedBox(height: 10),
      Text(
        'Email: ecogrow303@gmail.com',
        style: TextStyle(color: Colors.white70),
      ),
      SizedBox(height: 5),
      Text(
        'Phone: +123 456 7890',
        style: TextStyle(color: Colors.white70),
      ),
      SizedBox(height: 5),
      Text(
        'Address: Hoàng Minh Giám, Phường 3, Gò Vấp, Hồ Chí Minh, Vietnam',
        style: TextStyle(color: Colors.white70),
      ),
    ],
  );
}
