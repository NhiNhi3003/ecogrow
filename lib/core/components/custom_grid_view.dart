import 'package:flutter/material.dart';

class CustomAppGridView extends StatelessWidget {
  final int itemCount;
  final double maxCrossAxisExtent;
  final double childAspectRatio;
  final Widget? Function(BuildContext, int) itemBuilder;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;
  const CustomAppGridView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.maxCrossAxisExtent,
    required this.childAspectRatio,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxCrossAxisExtent,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: crossAxisSpacing ?? 30.0,
        mainAxisSpacing: mainAxisSpacing ?? 40.0,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
