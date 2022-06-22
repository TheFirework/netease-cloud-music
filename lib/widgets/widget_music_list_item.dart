import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/widgets/rounded_image.dart';

class WidgetMusicListItem extends StatelessWidget {
  final String? name;
  final String? picUrl;
  final int? id;
  final int? mvid;
  final String? artists;
  final VoidCallback onTap;

  const WidgetMusicListItem({
    Key? key,
    required this.onTap,
    this.name,
    this.picUrl,
    this.id,
    this.artists,
    this.mvid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        color: Colors.white,
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().setWidth(110),
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(20),right: ScreenUtil().setWidth(10)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            picUrl == null
                ? Container()
                : RoundedImage(
                    url: '$picUrl?param=150y150',
                    width: 80,
                    height: 80,
                    radius: 5,
                  ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    Text(
                      artists!,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            mvid == 0
                ? Container()
                : Container(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                    child: InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.play_circle_outline,
                        size: ScreenUtil().setWidth(40),
                        color: Colors.grey,
                      ),
                    ),
                  ),
            Container(
              padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
              child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.more_vert,
                  size: ScreenUtil().setWidth(40),
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
