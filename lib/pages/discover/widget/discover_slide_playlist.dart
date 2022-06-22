import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/pages/discover/model/creative_model.dart';
import 'package:netease_cloud_music/pages/discover/model/ui_element_model.dart';
import 'package:netease_cloud_music/widgets/gap.dart';
import 'package:netease_cloud_music/widgets/play_count.dart';
import 'package:netease_cloud_music/widgets/vertical_scroll_playlist.dart';

import 'ui_element_title.dart';

class DiscoverSlidePlaylist extends StatelessWidget {
  final UiElementModel uiElementModel;
  final List<CreativeModel> creatives;
  final bool radius;

  const DiscoverSlidePlaylist({
    Key? key,
    required this.uiElementModel,
    required this.creatives,
    this.radius = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(radius ? ScreenUtil().setWidth(20) : 0),
      ),
      child: SizedBox(
        height: ScreenUtil().setWidth(360),
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: UiElementTitle(
                elementModel: uiElementModel,
                onPressed: () {},
              ),
            ),
            Flexible(
              child: ListView.separated(
                padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(20),
                    right: ScreenUtil().setWidth(20)),
                itemBuilder: (context, index) {
                  return _buildItem(creatives[index], index);
                },
                separatorBuilder: (context, index) {
                  return Gap(width: ScreenUtil().setWidth(20));
                },
                itemCount: creatives.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(CreativeModel model, index) {
    if (model.resources == null) return Container();
    if (model.creativeType == 'scroll_playlist') {
      /// 垂直滚动的推荐歌单
      return VerticalScrollPlaylist(list: model.resources!);
    }
    final resource = model.resources![0];
    final resourceExtInfo = resource.resourceExtInfo!;
    String imageUrl = resource.uiElement.image!.imageUrl!;
    return GestureDetector(
      onTap: () {},
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: ScreenUtil().setWidth(200),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(ScreenUtil().setWidth(10)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setWidth(10)),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: ScreenUtil().setWidth(1),
                  ),
                ),
                child: CachedNetworkImage(
                  width: ScreenUtil().setWidth(200),
                  height: ScreenUtil().setWidth(200),
                  imageUrl: '$imageUrl?param=200y200',
                  imageBuilder: (image, imageProvider) {
                    return Stack(
                      children: [
                        Image(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                        _buildExtInfo(resourceExtInfo, imageProvider),
                      ],
                    );
                  },
                ),
              ),
            ),
            Gap(height: 10),
            Text(
              resource.uiElement.mainTitle?.title ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(18),
                color: Colors.black87,
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildExtInfo(
      ResourceExtInfo resourceExtInfo, ImageProvider<Object> imageProvider) {
    switch (resourceExtInfo.specialType) {
      case 200:
        // 视频合辑
        return Positioned.fill(
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(),
              ),
              _buildPlayCount(resourceExtInfo.playCount!, false),
              Center(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().setWidth(10)),
                      child: Image(
                        image: imageProvider,
                        width: ScreenUtil().setWidth(180),
                        height: ScreenUtil().setWidth(100),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Image.asset(
                      'assets/images/video_frame.png',
                      width: ScreenUtil().setWidth(180),
                      height: ScreenUtil().setWidth(100),
                      fit: BoxFit.fill,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      default:
        return _buildPlayCount(resourceExtInfo.playCount!, true);
    }
  }

  _buildPlayCount(int playCount, bool bg) {
    return Positioned(
      right: ScreenUtil().setWidth(8),
      top: ScreenUtil().setWidth(8),
      child: PlayCount(
        playCount: playCount,
        bg: bg,
      ),
    );
  }
}
