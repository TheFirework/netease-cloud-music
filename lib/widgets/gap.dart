import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gap extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final EdgeInsetsGeometry? margin;

  Gap({Key? key, this.height, this.margin, this.color, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      margin: margin,
      height: height != null ? ScreenUtil().setWidth(height!) : null,
      width: width != null ? ScreenUtil().setWidth(width!) : null,
    );
  }
}
