import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/pages/discover/model/creative_model.dart';
import 'package:netease_cloud_music/pages/discover/model/ui_element_model.dart';
import 'package:netease_cloud_music/widgets/gap.dart';

import 'ui_element_title.dart';

class HotTopic extends StatelessWidget {
  final UiElementModel uiElementModel;
  final List<CreativeModel> creatives;

  const HotTopic({Key? key, required this.uiElementModel, required this.creatives}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(300),
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
          Gap(height: 20),
        ],
      ),
    );
  }
}
