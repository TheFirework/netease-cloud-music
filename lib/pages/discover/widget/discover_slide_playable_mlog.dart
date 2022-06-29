import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/pages/discover/model/discover_model.dart';
import 'package:netease_cloud_music/pages/discover/model/mlog_data_model.dart';
import 'package:netease_cloud_music/widgets/gap.dart';
import 'package:netease_cloud_music/widgets/play_count.dart';

import 'ui_element_title.dart';

class DiscoverSlidePlayableMlog extends StatelessWidget {
  final Blocks blocks;

  const DiscoverSlidePlayableMlog({Key? key, required this.blocks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MlogDataModel> list =
        (blocks.extInfo as List).map((e) => MlogDataModel.fromJson(e)).toList();
    return Container(
      height: ScreenUtil().setWidth(420),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(15))),
      child: Column(
        children: [
          UiElementTitle(
            elementModel: blocks.uiElement!,
            onPressed: () {},
            showButton: false,
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
              itemBuilder: (context, index) {
                return _buildItem(list.elementAt(index));
              },
              separatorBuilder: (context, index) {
                return Gap(width: 20);
              },
              itemCount: list.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(MlogDataModel mlogDataModel) {
    double width = ScreenUtil().setWidth(200);
    double height = ScreenUtil().setWidth(250);
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(15)),
              child: CachedNetworkImage(
                width: width,
                height: height,
                imageUrl:
                    "${mlogDataModel.resource?.mlogBaseData.coverUrl}?param=200y200",
                imageBuilder: (context, imageProvidr) {
                  return Stack(
                    children: [
                      Image(
                        image: imageProvidr,
                        width: width,
                        height: height,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        right: ScreenUtil().setWidth(8),
                        top: ScreenUtil().setWidth(8),
                        child: PlayCount(
                          playCount: mlogDataModel.resource!.mlogExtVO.playCount,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Gap(height: 16),
            Text(
              mlogDataModel.resource!.mlogBaseData.text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(18),
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
