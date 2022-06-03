// Summary: Custom 'TextWidget' for quick Text UI
import 'package:flutter/material.dart';
import 'package:neo_todo/constants/colors.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.title, {
    Key? key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.textDecoration,
    this.maxLines,
  }) : super(key: key);

  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight,
          color: color ?? defaultTextColor,
          decoration: textDecoration,
          decorationStyle: TextDecorationStyle.solid),
      textAlign: textAlign ?? TextAlign.start,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}
