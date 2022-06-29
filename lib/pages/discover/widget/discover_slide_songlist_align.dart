import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/models/song_model.dart';
import 'package:netease_cloud_music/pages/discover/model/creative_model.dart';
import 'package:netease_cloud_music/pages/discover/model/ui_element_model.dart';
import 'package:netease_cloud_music/widgets/gap.dart';

import 'ui_element_title.dart';

class DiscoverSlideSonglistAlign extends StatelessWidget {
  final UiElementModel uiElementModel;
  final List<CreativeModel> creatives;

  const DiscoverSlideSonglistAlign(
      {Key? key, required this.uiElementModel, required this.creatives})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(500),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20)),
      ),
      child: Column(
        children: [
          UiElementTitle(
            elementModel: uiElementModel,
            onPressed: () {},
          ),
          Expanded(
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.9),
              itemCount: creatives.length,
              itemBuilder: (context, index) {
                final creative = creatives.elementAt(index);
                return Column(
                  children: _buildPageCard(creative),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageCard(CreativeModel creative) {
    if (creative.resources?.isEmpty == true) return List.empty();
    final List<Widget> widgets = List.empty(growable: true);
    for (var e in creative.resources!) {
      widgets.add(_buildItem(e));
    }
    return widgets;
  }

  Widget _buildItem(Resources resources) {
    SongModel? song = resources.resourceExtInfo?.song;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        print('parent');
      },
      child: Container(
        padding: EdgeInsets.only(right: ScreenUtil().setWidth(30)),
        child: Column(
          children: [
            SizedBox(
              height: ScreenUtil().setWidth(120),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().setWidth(16)),
                    child: CachedNetworkImage(
                      width: ScreenUtil().setWidth(100),
                      height: ScreenUtil().setWidth(100),
                      imageUrl: "${song?.al.picUrl}?param=100y100",
                      imageBuilder: (context, imageProvider) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Image(image: imageProvider),

                            /// 未播放
                            Icon(
                              Icons.play_arrow_rounded,
                              size: ScreenUtil().setWidth(60),
                              color: Colors.white.withOpacity(0.8),
                            ),

                            /// 播放中
                            // Icon(
                            //   Icons.bar_chart_outlined,
                            //   size: ScreenUtil().setWidth(60),
                            //   color: Colors.white.withOpacity(0.8),
                            // ),
                          ],
                        );
                      },
                    ),
                  ),
                  Gap(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTitle(resources.uiElement, song!),
                        _buildSubTitle(resources.uiElement),
                      ],
                    ),
                  ),
                  if (song.mv != null)
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        print('child');
                      },
                      child: const Icon(
                        Icons.play_circle_outline_sharp,
                        color: Colors.grey,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildTitle(UiElementModel uiElement, SongModel song) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
          text: uiElement.mainTitle?.title,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(26),
            color: Colors.black87,
          ),
          children: [
            WidgetSpan(child: Gap(width: 8)),
            TextSpan(
              text: '-',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(18),
                color: Colors.grey.shade500,
              ),
            ),
            WidgetSpan(child: Gap(width: 8)),
            TextSpan(
                text: song.ar.map((e) => e.name!).join("/"),
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(18),
                  color: Colors.grey.shade500,
                )),
          ]),
    );
  }

  _buildSubTitle(UiElementModel uiElement) {
    if (uiElement.subTitle?.title?.isEmpty == true) return Container();
    // songRcmdTag
    // songRcmdFromComment
    if (uiElement.subTitle?.titleType == 'songRcmdTag') {
      return Container(
        height: ScreenUtil().setWidth(24),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(8)),
        decoration: BoxDecoration(
          color: const Color(0xFFF8e2ca),
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5)),
        ),
        child: Text(
          uiElement.subTitle?.title ?? "",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(18),
            color: const Color(0xFFcb8903),
          ),
        ),
      );
    }
    if (uiElement.subTitle?.titleType == 'songRcmdFromComment') {
      return Text(
        uiElement.subTitle?.title ?? "",
        style: TextStyle(
          fontSize: ScreenUtil().setSp(20),
          color: Colors.grey.shade500,
        ),
      );
    }

    return Container();
  }
}
