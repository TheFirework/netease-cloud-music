import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/provider/app_provider.dart';
import 'package:provider/provider.dart';

class DiscoverAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DiscoverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Container(
          height: 46,
          child: Row(
            children: [
              SizedBox(
                width: ScreenUtil().setWidth(48.0),
                child: IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black87),
                  onPressed: () {
                    Provider.of<AppProvider>(context, listen: false)
                        .openDrawer();
                  },
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    print('点击搜索框');
                  },
                  child: Container(
                    height: 30,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                      color: const Color(0xffEDEDED),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          size: ScreenUtil().setWidth(34),
                          color: const Color(0xffA9A9A9),
                        ),
                        Text(
                          "点击搜索",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(22),
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(46);
}
