import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final Color? filledColor;
  final Color borderColor;
  final TextStyle? hintStyle;
  final String? hintText;
  final Widget? label;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isObscureText;
  final bool isPassword;
  final TextStyle? textStyle;
  final bool readOnly;
  final int maxLines;
  const CustomTextFormField({
    super.key,
    this.controller,
    this.filledColor = AppColors.whiteColor,
    this.borderColor = AppColors.whiteColor,
    this.hintStyle,
    this.hintText,
    this.label,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.isObscureText = false,
    this.isPassword = false,
    this.textStyle,
    this.readOnly = false,
    this.maxLines = 1,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      child: TextFormField(
        style: widget.textStyle,
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.filledColor,
          enabledBorder: builtDecorationBorder(color: widget.borderColor),
          focusedBorder: builtDecorationBorder(color: widget.borderColor),
          errorBorder: builtDecorationBorder(color: AppColors.redColor),
          focusedErrorBorder: builtDecorationBorder(color: AppColors.redColor),
          errorStyle: AppStyles.medium18White.copyWith(
            color: AppColors.redColor,
          ),
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          label: widget.label,
          labelStyle: widget.labelStyle,

          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
        ),
        validator: widget.validator,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.isPassword,
      ),
    );
  }

  OutlineInputBorder builtDecorationBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: color, width: 1),
    );
  }
}
