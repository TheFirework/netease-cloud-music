import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/widgets/gap.dart';
import 'package:netease_cloud_music/widgets/widget_play_list_cover.dart';

class PlayListWidget extends StatelessWidget {
  final String? picUrl;
  final String? text;
  final String? subText;
  final int? playCount;
  final int maxLines;
  final VoidCallback onTap;
  final int? index;

  const PlayListWidget(
      {Key? key,
      this.picUrl,
      required this.text,
      this.subText,
        this.playCount,
      this.maxLines = -1,
      required this.onTap,
      this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: SizedBox(
        width: ScreenUtil().setWidth(220),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            picUrl == null
                ? Container()
                : PlayListCoverWidget(
                    playCount: playCount,
                    url: picUrl,
                    width: 220,
                  ),
            index == null
                ? Container()
                : Text(
                    index.toString(),
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
            Gap(height: 5),
            Text(
              text!,
              style: const TextStyle(fontSize: 12, color: Colors.black87),
              maxLines: maxLines != -1 ? maxLines : null,
              overflow: maxLines != -1 ? TextOverflow.ellipsis : null,
            ),
            subText == null
                ? Container()
                : Gap(
                    height: 2,
                  ),
            subText == null
                ? Container()
                : Text(
                    subText!,
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                    maxLines: maxLines != -1 ? maxLines : null,
                    overflow: maxLines != -1 ? TextOverflow.ellipsis : null,
                  ),
          ],
        ),
      ),
    );
  }
}
