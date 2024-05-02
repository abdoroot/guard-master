import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:guard_master/common/resources/app_color.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.fontSize,
    this.textAlign,
    this.backgroundColor,
    this.color = AppColors.black,
    this.fontWeight = FontWeight.w400,
    this.maxLines,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.style,
  }) : super(key: key);
  final String text;
  final double? fontSize;
  final int? maxLines;
  final Color? color;
  final Color? backgroundColor;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: fontSize ?? 11.sp,
                color: color,
                fontWeight: fontWeight,
                backgroundColor: backgroundColor,
                decoration: textDecoration,
                fontStyle: fontStyle,
              ),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
