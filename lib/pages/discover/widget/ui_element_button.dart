import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/core/values/constants.dart';
import 'package:netease_cloud_music/pages/discover/model/ui_element_model.dart';

class UiElementButton extends StatelessWidget {
  final ElementButton? elementButton;
  final VoidCallback? onPressed;

  const UiElementButton({Key? key, this.elementButton, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      height: ScreenUtil().setWidth(40),
      color: Colors.transparent,
      elevation: 0,
      padding: const EdgeInsets.all(0),
      minWidth: ScreenUtil().setWidth(88),
      focusElevation: 0,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(18)),
        side: const BorderSide(color: Colors.black26),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (elementButton?.actionType == "client_customized" && elementButton?.action == "play_all_song")
            Image.asset(
              "assets/images/icon_event_video_play.png",
              color: Colors.black87,
              width: ScreenUtil().setWidth(24),
              height: ScreenUtil().setWidth(24),
            ),
          Text(
            elementButton!.text,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              color: Colors.black87,
            ),
          ),
          if (elementButton?.actionType == ACTION_TYPE)
            Icon(
              Icons.keyboard_arrow_right,
              size: ScreenUtil().setSp(25),
              color: Colors.black87,
            )
        ],
      ),
    );
  }
}
