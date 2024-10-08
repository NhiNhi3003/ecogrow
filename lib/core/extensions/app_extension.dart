import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

extension AppExtension on BuildContext {
  double getWidth() => MediaQuery.of(this).size.width;
  double getHeight() => MediaQuery.of(this).size.height;
  void pushAndRemoveUntil(
      {required Widget screen, PageTransitionType? type, int? milliseconds}) {
    Navigator.of(this).pushAndRemoveUntil(
      PageTransition(
        duration: Duration(milliseconds: milliseconds ?? 300),
        type: type ?? PageTransitionType.fade,
        child: screen,
      ),
      (route) => false,
    );
  }

  void push({required Widget screen}) {
    Navigator.of(this).push(
      PageTransition(
        duration: const Duration(milliseconds: 100),
        type: PageTransitionType.fade,
        child: screen,
      ),
    );
  }

  void pushRtl({required Widget screen}) {
    Navigator.of(this).push(
      PageTransition(
        duration: const Duration(milliseconds: 400),
        type: PageTransitionType.rightToLeft,
        child: screen,
      ),
    );
  }
}
