import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final double? radius;
  final BoxFit? fit;

  const RoundedImage({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.radius = 10,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(ScreenUtil().setWidth(radius!)),
      ),
      child: Image.network(url,
        width: width == null ? null : ScreenUtil().setWidth(width!),
        height: height == null ? null : ScreenUtil().setWidth(height!),
        fit: fit,
      ),
    );
  }
}
