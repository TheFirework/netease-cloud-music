import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/provider/play_songs_provider.dart';
import 'package:provider/provider.dart';

typedef ValueCallback = void Function(PlaySongsProvider value);

class MusicListHeader extends StatelessWidget implements PreferredSizeWidget {
  final ValueCallback onTap;

  const MusicListHeader({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaySongsProvider>(builder: (context, value, child) {
      return InkWell(
        onTap: () {
          onTap(value);
        },
        child: Container(
          color: Colors.white,
          child: SizedBox.fromSize(
            size: preferredSize,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(20),
                  ),
                  child: Icon(
                    Icons.play_circle_fill,
                    size: ScreenUtil().setWidth(50),
                    color: Colors.red,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Text(
                    "播放全部",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  Size get preferredSize => Size.fromHeight(ScreenUtil().setWidth(90));
}
