import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:flutter/material.dart';

class ListNoDataCustom extends StatelessWidget {
  const ListNoDataCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: context.getWidth() * 0.8),
      children: const [
        Text(textAlign: TextAlign.center, 'Không có dữ liệu.'),
      ],
    );
  }
}
