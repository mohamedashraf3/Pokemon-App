import 'package:flutter/material.dart';
import '../../../viwe_model/utils/app_colors.dart';
class TextCustom extends StatelessWidget {
  const TextCustom(
      {super.key,
      required this.text,
      this.fontWeight,
      this.color = AppColors.white,
      this.fontSize = 20, this.fontStyle});

  final String text;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
