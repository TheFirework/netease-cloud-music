import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/utils/number.dart';

class PlayListCoverWidget extends StatelessWidget {
  final String? url;
  final int? playCount;
  final double? width;
  final double? height;
  final double? radius;

  const PlayListCoverWidget(
      {Key? key,
      this.url,
      this.playCount,
      this.width = 200,
      this.height,
      this.radius = 18})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          BorderRadius.all(Radius.circular(ScreenUtil().setWidth(radius!))),
      child: SizedBox(
        width: ScreenUtil().setWidth(width!),
        height: ScreenUtil().setWidth(height ?? width!),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Image(
              image: CachedNetworkImageProvider('$url?param=200y200'),
              width: ScreenUtil().setWidth(width!),
              height: ScreenUtil().setWidth(height ?? width!),
              fit: BoxFit.cover,
            ),
            playCount == null
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(
                      top: ScreenUtil().setWidth(4),
                      right: ScreenUtil().setWidth(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/icon_triangle.png',
                          width: ScreenUtil().setWidth(30),
                          height: ScreenUtil().setWidth(30),
                        ),
                        Text(
                          NumberUtils.amountConversion(playCount!),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
