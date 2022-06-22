import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/theme/color.dart';
import 'package:netease_cloud_music/utils/navigator_util.dart';
import 'package:netease_cloud_music/widgets/gap.dart';

class IconMenu extends StatelessWidget {
  var today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    List<Map> menus = [
      {'title': '每日推荐', 'icon': 'assets/images/icon_daily.png'},
      {'title': '歌单', 'icon': 'assets/images/icon_playlist.png'},
      {'title': '排行榜', 'icon': 'assets/images/icon_rank.png'},
      {'title': '私人FM', 'icon': 'assets/images/icon_radio.png'},
      {'title': '直播', 'icon': 'assets/images/icon_live.png'},
    ];

    double width = ScreenUtil().setWidth(100);

    return GridView.custom(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: menus.length,
        childAspectRatio: 1 / 1.1,
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          Map menu = menus[index];
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              switch (index) {
                case 0:
                  NavigatorUtil.goDailySongsPage(context);
                  break;
                case 1:
                  break;
                case 2:
                  // NavigatorUtil.goTopListPage(context);
                  break;
              }
            },
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: width,
                      height: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width / 2),
                        color: AppColor.primaryLightColor,
                      ),
                    ),
                    Image.asset(
                      menu['icon'],
                      width: width,
                      height: width,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: menu['title'] == '每日推荐'
                          ? Text(
                              '${today.day}',
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const Text(''),
                    )
                  ],
                ),
                Gap(height: 10),
                Text(menu['title'],
                    style:
                        const TextStyle(color: Colors.black87, fontSize: 12)),
              ],
            ),
          );
        },
        childCount: menus.length,
      ),
    );
  }
}
