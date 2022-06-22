import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/application.dart';
import 'package:netease_cloud_music/models/song_model.dart';
import 'package:netease_cloud_music/provider/play_songs_provider.dart';
import 'package:netease_cloud_music/theme/color.dart';
import 'package:netease_cloud_music/utils/navigator_util.dart';
import 'package:netease_cloud_music/widgets/gap.dart';
import 'package:netease_cloud_music/widgets/rounded_image.dart';
import 'package:provider/provider.dart';

class PlayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Consumer<PlaySongsProvider>(
        builder: (BuildContext context, value, Widget? child) {
          Widget child;

          if (value.allSongs.isEmpty) {
            child = const Text('暂无正在播放的歌曲');
          } else {
            SongModel curSong = value.curSong;
            child = GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                // NavigatorUtil.goPlaySongsPage(context);
              },
              child: Row(
                children: [
                  RoundedImage(
                    url: curSong.al.picUrl!,
                    width: 80,
                    height: 80,
                    radius: 80,
                  ),
                  Gap(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          curSong.name,
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(25), color: Colors.black87),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          curSong.ar.map((e) => e.name).toList().join('/'),
                          style:  TextStyle(
                              fontSize: ScreenUtil().setSp(18), color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (value.isPlaying) {
                        value.pause();
                      } else {
                        value.play();
                      }
                    },
                    child: Image.asset(
                      value.isPlaying
                          ? 'assets/images/pause.png'
                          : 'assets/images/play.png',
                      width: ScreenUtil().setWidth(50),
                    ),
                  ),
                  Gap(width: 15),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/list.png',
                      width: ScreenUtil().setWidth(50),
                    ),
                  ),
                ],
              ),
            );
          }

          return Container(
            width: Application.screenWidth,
            height: ScreenUtil().setWidth(110),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: AppColor.borderColor,width: 0.5)),
              color: Colors.white,
            ),
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
            child: Container(
              width: Application.screenWidth,
              height: ScreenUtil().setWidth(110),
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
              alignment: Alignment.center,
              child: child,
            ),
          );
        },
      ),
    );
  }
}
