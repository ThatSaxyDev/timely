// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timely/theme/palette.dart';


class TextInputWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final String hintText;
  final String inputTitle;
  final TextEditingController controller;
  final bool obscuretext;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffix;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final Color? titleColor;
  final Color? borderColor;
  final FontWeight? titleFontWeight;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final Widget? iconn;
  const TextInputWidget({
    Key? key,
    this.height,
    this.width,
    required this.hintText,
    required this.inputTitle,
    required this.controller,
    this.obscuretext = false,
    this.validator,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.suffix,
    this.focusNode,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters,
    this.titleColor,
    this.borderColor,
    this.titleFontWeight,
    this.onTap,
    this.onTapOutside,
    this.iconn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        // color: Colors.red,
        height: 66.h,
        width: width ?? double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              inputTitle,
              style: TextStyle(
                  color: titleColor ?? Pallete.textGreydarker,
                  fontSize: 14.sp,
                  fontWeight: titleFontWeight ?? FontWeight.w500),
            ),
            iconn ?? const SizedBox.shrink(),
            SizedBox(
              height: 40.h,
              child: TextFormField(
                onTap: onTap,
                onTapOutside: onTapOutside,
                keyboardType: keyboardType,
                focusNode: focusNode,
                onFieldSubmitted: onFieldSubmitted,
                onChanged: onChanged,
                style: TextStyle(
                  fontSize: 15.sp,
                ),
                controller: controller,
                inputFormatters: inputFormatters,
                obscureText: obscuretext,
                obscuringCharacter: '*',
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  isDense: true,
                  suffix: suffix,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.w).copyWith(left: 12.w),
                  helperText: " ",
                  helperStyle: const TextStyle(fontSize: 0.0005),
                  errorStyle: const TextStyle(fontSize: 0.0005),
                  suffixIcon: suffixIcon,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Pallete.textGreylighter,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Pallete.borderGrey),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Pallete.borderGrey),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Pallete.borderGrey),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Pallete.borderGrey),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                validator: validator,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
