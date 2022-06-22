import 'package:flutter/material.dart';

class IconFont extends StatelessWidget {
  /// 字体编码 0xe63e
  final int codePoint;

  /// 所属字体
  final String fontFamily;

  /// 字体所属的包
  final String? fontPackage;

  /// 是否启用镜像，向左还是向右
  final bool matchTextDirection;

  final double? size;
  final Color? color;

  const IconFont({
    Key? key,
    required this.codePoint,
    this.fontFamily = 'iconfont',
    this.size,
    this.color,
    this.fontPackage,
    this.matchTextDirection = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      IconData(
        codePoint,
        fontFamily: fontFamily,
        fontPackage: fontPackage,
        matchTextDirection: matchTextDirection,
      ),
      color: color,
      size: size,
    );
  }
}
