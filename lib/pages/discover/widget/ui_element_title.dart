import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/pages/discover/model/ui_element_model.dart';

import 'ui_element_button.dart';

class UiElementTitle extends StatelessWidget {
  final UiElementModel elementModel;

  final VoidCallback? onPressed;

  const UiElementTitle({Key? key, required this.elementModel, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
      height: ScreenUtil().setWidth(80),
      margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              width: ScreenUtil().setWidth(240),
              child: Text(
                elementModel.subTitle!.title ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(26),
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
          ),
          if (elementModel.button != null)
            Expanded(
              flex: 0,
              child: UiElementButton(
                elementButton: elementModel.button,
                onPressed: onPressed,
              ),
            )
        ],
      ),
    );
  }
}
