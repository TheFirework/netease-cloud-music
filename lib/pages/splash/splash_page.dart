import 'package:flutter/material.dart';
import 'package:netease_cloud_music/api/login_api.dart';
import 'package:netease_cloud_music/provider/user_provider.dart';
import 'package:netease_cloud_music/theme/color.dart';
import 'package:netease_cloud_music/utils/navigator_util.dart';
import 'package:netease_cloud_music/widgets/widget_logo.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1000), () {
      UserProvider userProvider =
      Provider.of<UserProvider>(context, listen: false);
      userProvider.initUser();

      // PlaySongsModel playSongsModel =
      //     Provider.of<PlaySongsModel>(context, listen: false);
      // 判断是否有保存的歌曲列表
      if (userProvider.user != null) {
        LoginApi.refreshLogin().then((value) {
          if (value.data != -1) {
            NavigatorUtil.goHomePage(context);
          }
        });
        // Provider.of<PlayListModel>(context, listen: false).user = userModel.user!;
      } else {
        NavigatorUtil.goLoginPage(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 200),
              child: LogoWidget(),
            )
          ],
        ),
      ),
    );
  }
}
