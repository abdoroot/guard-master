import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guard_master/common/resources/app_color.dart';
import 'package:sizer/sizer.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    this.onPressed,
    this.color = AppColors.black,
    this.radius = 100,
    required this.child,
    this.side = BorderSide.none,
    this.maximumSize,
    this.minimumSize,
    this.isCircle = false,
    this.elevation,
    this.padding,
    this.borderRadius,
    this.label,
  }) : super(key: key);
  final void Function()? onPressed;
  final Color? color;
  final double radius;
  final BorderSide side;
  final Size? maximumSize, minimumSize;
  final bool isCircle;
  final String? label;
  final double? elevation;
  final Widget child;
  final EdgeInsets? padding;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(padding),
          elevation: MaterialStateProperty.all(elevation),
          maximumSize: MaterialStateProperty.all(maximumSize),
          minimumSize: MaterialStateProperty.all(minimumSize),
          backgroundColor: MaterialStateProperty.all(
            color,
          ),
          textStyle: MaterialStateProperty.all(GoogleFonts.cairo(
            color: AppColors.white,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          )),
          shape: isCircle
              ? MaterialStateProperty.all<CircleBorder>(
                  CircleBorder(side: side),
                )
              : MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius:
                          borderRadius ?? BorderRadius.circular(radius),
                      side: side),
                ),
        ),
        onPressed: onPressed,
        child: child);
  }
}
