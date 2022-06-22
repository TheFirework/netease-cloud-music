import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool? showMore;
  final String? moreText;
  final Widget? rightButton;
  final Color? bgColor;

  const Header({
    Key? key,
    required this.title,
    this.onTap,
    this.moreText = '更多',
    this.rightButton,
    this.showMore = true,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(20),
        top: ScreenUtil().setWidth(20),
        right: ScreenUtil().setWidth(20),
        bottom: ScreenUtil().setWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(30),
              fontWeight: FontWeight.w600,
            ),
          ),
          rightButton ?? Container(),
          rightButton == null && showMore!
              ? InkWell(
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.elliptical(50, 50)),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setWidth(4),
                      horizontal: ScreenUtil().setWidth(10),
                    ),
                    child: Row(
                      children: [
                        Text(
                          moreText!,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(22),
                            color: Colors.black87,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: ScreenUtil().setWidth(20),
                          color: Colors.black87,
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
