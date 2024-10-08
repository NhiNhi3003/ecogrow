import 'package:flutter/material.dart';

class FlexibleTextCustom extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const FlexibleTextCustom(
    this.text, {
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        text,
        softWrap: true,
        overflow: TextOverflow.visible,
        textAlign: TextAlign.center,
        style: style,
      ),
    );
  }
}
