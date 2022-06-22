import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/utils/number.dart';

class PlayCount extends StatelessWidget {
  final int playCount;
  final bool bg;

  const PlayCount({
    Key? key,
    required this.playCount,
    this.bg = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(15)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
        height: ScreenUtil().setWidth(32),
        color: bg ? Colors.black.withOpacity(0.2) : Colors.transparent,
        child: Row(
          children: [
            Image.asset(
              'assets/images/icon_triangle.png',
              width: ScreenUtil().setWidth(20),
              height: ScreenUtil().setWidth(20),
            ),
            Text(
              NumberUtils.amountConversion(playCount),
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(18),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
