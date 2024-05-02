import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:guard_master/common/resources/app_color.dart';
import 'package:guard_master/common/utils/extension.dart';
import 'package:guard_master/common/widgets/custom_text.dart';
import 'package:guard_master/generated/assets/assets.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.maxLines = 1,
    this.minLines = 1,
    this.labelText,
    this.prefixIcon,
    this.filled = true,
    this.radius = 100,
    this.obscureText,
    this.border = true,
    this.suffixIcon,
    this.prefixIconColor = AppColors.dark2,
    this.suffixIconColor = AppColors.dark2,
    this.controller,
    this.textDirection,
    this.validator,
    this.onChange,
    this.maxLength,
    this.counterText,
    this.onSave,
    this.enabled,
    this.textAlign = TextAlign.start,
    this.labelAlign = TextAlign.center,
    this.labelColor = AppColors.red,
    this.isNumberOnly = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.autofocus,
    this.onFieldSubmitted,
    this.width,
    this.height,
    this.contentPadding,
    this.focusNode,
    this.fillColor,
    this.onTap,
    this.autofillHints,
    this.isLabel = true,
    this.borderRadius,
  }) : super(key: key);
  final int? maxLines, minLines;
  final String? hintText, labelText;
  final Widget? prefixIcon, suffixIcon;
  final Color? prefixIconColor, suffixIconColor, fillColor, labelColor;
  final bool? filled, obscureText, enabled;
  final bool border, isNumberOnly, isLabel;
  final TextAlign textAlign, labelAlign;
  final double radius;
  final BorderRadius? borderRadius;
  final TextEditingController? controller;
  final TextDirection? textDirection;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;
  final FormFieldSetter<String>? onSave;
  final int? maxLength;
  final double? width, height;
  final String? counterText;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final bool? autofocus;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final Iterable<String>? autofillHints;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obsecureText = widget.obscureText ?? false;
  Color fillColor = AppColors.white;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (widget.isLabel) ...[
          SizedBox(
            width: 100.w,
            child: CustomText(
              textAlign: widget.labelAlign,
              text: widget.labelText ?? widget.hintText ?? "",
              color: widget.labelColor,
            ),
          ),
          1.5.h.sh,
        ],
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: TextFormField(
            autofillHints: widget.autofillHints,
            // onTap: widget.onTap ??
            //     () {
            //       setState(() {
            //         fillColor = AppColors.lightPrimary;
            //       });
            //     },
            focusNode: widget.focusNode,
            onFieldSubmitted: widget.onFieldSubmitted,
            textInputAction: widget.textInputAction,
            autofocus: widget.autofocus ?? false,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            enabled: widget.enabled,
            validator: widget.validator,
            controller: widget.controller,
            onChanged: widget.onChange,
            onSaved: widget.onSave,
            textDirection: widget.textDirection,
            obscureText: obsecureText,
            obscuringCharacter: '*',
            keyboardType: widget.isNumberOnly
                ? const TextInputType.numberWithOptions(decimal: true)
                : widget.keyboardType,
            inputFormatters: widget.isNumberOnly
                ? [
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                  ]
                : null,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(),
            textAlign: widget.textAlign,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
              counterText: widget.counterText,
              suffixIcon: widget.suffixIcon,
              suffixIconColor: widget.suffixIconColor,
              prefixIcon: widget.prefixIcon ?? toggleVisibility(),
              prefixIconColor: widget.prefixIconColor,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              hintText: widget.hintText ?? widget.labelText,
              hintStyle: Theme.of(context).textTheme.bodySmall,
              // labelText: widget.labelText,
              labelStyle: Theme.of(context).textTheme.labelSmall,
              errorStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.red),
              filled: true,
              fillColor: widget.fillColor ?? fillColor,
              enabledBorder: widget.border
                  ? OutlineInputBorder(
                      borderRadius: widget.borderRadius ??
                          BorderRadius.circular(widget.radius),
                      borderSide: BorderSide(color: AppColors.struckColor),
                    )
                  : null,
              disabledBorder: widget.border
                  ? OutlineInputBorder(
                      borderRadius: widget.borderRadius ??
                          BorderRadius.circular(widget.radius),
                      borderSide: BorderSide(color: AppColors.struckColor),
                    )
                  : null,
              border: widget.border
                  ? OutlineInputBorder(
                      borderRadius: widget.borderRadius ??
                          BorderRadius.circular(widget.radius),
                      borderSide: BorderSide(color: AppColors.struckColor),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  toggleVisibility() {
    if (obsecureText) {
      return IconButton(
        icon: SvgPicture.asset(
          Assets.assetsImagesSvgVisibilityOffIc,
        ),
        onPressed: () {
          setState(() {
            obsecureText = false;
          });
        },
      );
    } else if (widget.obscureText != null) {
      return IconButton(
        icon: Icon(
          Icons.visibility_outlined,
          color: AppColors.dark2,
          size: 6.w,
        ),
        onPressed: () {
          setState(() {
            obsecureText = true;
          });
        },
      );
    } else {
      return null;
    }
  }
}
