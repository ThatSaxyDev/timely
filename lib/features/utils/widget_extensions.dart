import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const ext = 0;

extension WidgetExtensionss on num {
  Widget get sbH => SizedBox(
        height: h,
      );

  Widget get sbW => SizedBox(
        width: w,
      );

  EdgeInsetsGeometry get padV => EdgeInsets.symmetric(vertical: h);

  EdgeInsetsGeometry get padH => EdgeInsets.symmetric(horizontal: w);
}

extension WidgetExtensions on double {
  Widget get sbH => SizedBox(
        height: h,
      );

  Widget get sbW => SizedBox(
        width: w,
      );

  EdgeInsetsGeometry get padA => EdgeInsets.all(w);

  EdgeInsetsGeometry get padV => EdgeInsets.symmetric(vertical: h);

  EdgeInsetsGeometry get padH => EdgeInsets.symmetric(horizontal: w);
}

double width(BuildContext context) {
  return ScreenUtil().screenWidth;
}

double height(BuildContext context) {
  return ScreenUtil().screenHeight;
}
