import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/number.dart';

class PlayCountWidget extends StatelessWidget {
  final int? playCount;

  const PlayCountWidget({Key? key, this.playCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Image.asset(
            'assets/images/icon_triangle.png',
            width: ScreenUtil().setWidth(30),
            height: ScreenUtil().setWidth(30),
          ),
        ),
        Text(
          NumberUtils.amountConversion(playCount!),
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(20),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
