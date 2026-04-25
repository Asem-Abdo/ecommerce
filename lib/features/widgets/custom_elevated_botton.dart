import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedBotton extends StatelessWidget {
  final String text;
  final Color backGroundColor;
  final TextStyle textStyle;
  final void Function()? onPressed;
  const CustomElevatedBotton({
    super.key,
    required this.text,
    required this.backGroundColor,
    required this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        backgroundColor: backGroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        height: 64.h,
        child: Text(text, style: textStyle),
      ),
    );
  }
}
