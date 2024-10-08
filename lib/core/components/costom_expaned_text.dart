import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final String content;
  final double? horizontalPadding;
  final double? verticalPadding;
  final bool? isMobile;
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.content,
    this.horizontalPadding,
    this.verticalPadding,
    this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 0.0,
          vertical: verticalPadding ?? 0.0),
      child: Theme(
        data: Theme.of(context)
            .copyWith(dividerColor: Colors.transparent), // Tắt divider
        child: ExpansionTile(
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(left: 60),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  content,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
