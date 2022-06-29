import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/pages/discover/model/creative_model.dart';
import 'package:netease_cloud_music/pages/discover/model/ui_element_model.dart';
import 'package:netease_cloud_music/widgets/gap.dart';

import 'ui_element_title.dart';

class HotTopic extends StatelessWidget {
  final UiElementModel uiElementModel;
  final List<CreativeModel> creatives;

  const HotTopic(
      {Key? key, required this.uiElementModel, required this.creatives})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(290),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UiElementTitle(
            elementModel: uiElementModel,
            onPressed: () {},
          ),
          Expanded(
              child: PageView.builder(
                itemCount: creatives.length,
                controller: PageController(viewportFraction: 0.94),
                itemBuilder: (context, index) {
                  return Column(
                    children:
                        _buildPageCard(creatives.elementAt(index).resources),
                  );
                },
              )),
        ],
      ),
    );
  }

  List<Widget> _buildPageCard(List<Resources>? resources) {
    List<Widget> widgets = [];
    resources?.forEach((element) {
      widgets.add(_buildItem(element));
    });

    return widgets;
  }

  Widget _buildItem(Resources element) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(15)),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: element.uiElement.mainTitle?.titleImgUrl ?? "",
              width: ScreenUtil().setWidth(28),
              height: ScreenUtil().setWidth(28),
            ),
            Gap(width: 10),
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: element.uiElement.mainTitle?.title,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(24),
                        color: Colors.black87,
                      ),
                    ),
                    if (element.uiElement.labelUrls?.isNotEmpty == true)
                      WidgetSpan(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                          child: CachedNetworkImage(
                            imageUrl: element.uiElement.labelUrls!.elementAt(0),
                            width: ScreenUtil().setWidth(28),
                            height: ScreenUtil().setWidth(28),
                          ),
                        ),
                      ),
                  ],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Gap(width: 20),
            Text(
              element.uiElement.subTitle?.title ?? "",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(20),
                color: Colors.black54,
              ),
            ),
            Gap(width: 30),
          ],
        ),
      ),
    );
  }
}
