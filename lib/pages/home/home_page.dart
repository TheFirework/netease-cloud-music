import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/pages/discover/discover_page.dart';
import 'package:netease_cloud_music/pages/my/my_page.dart';
import 'package:netease_cloud_music/pages/trend/trend_page.dart';
import 'package:netease_cloud_music/pages/video/video_page.dart';
import 'package:netease_cloud_music/provider/app_provider.dart';
import 'package:netease_cloud_music/utils/toast.dart';
import 'package:netease_cloud_music/widgets/iconfont.dart';
import 'package:netease_cloud_music/widgets/widget_play.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  late PageController pageController;
  int _page = 0;
  DateTime? lastPopTime;

  // tab栏动画
  void handleNavBarTap(int index) {
    pageController.jumpToPage(index);
  }

  // tab栏页码切换
  void handlePageChanged(int page) {
    setState(() {
      _page = page;
    });
  }


  // 底部导航
  late final List<BottomNavigationBarItem> bottomTabs =
      <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: IconFont(codePoint: 0xe69f, size: 28),
      activeIcon: IconFont(codePoint: 0xe69f, color: Colors.red, size: 28),
      label: '发现',
    ),
    const BottomNavigationBarItem(
      icon: IconFont(codePoint: 0xe7c2, size: 28),
      activeIcon: IconFont(codePoint: 0xe7c2, color: Colors.red, size: 28),
      label: '动态',
    ),
    const BottomNavigationBarItem(
      icon: IconFont(codePoint: 0xe612, size: 28),
      activeIcon: IconFont(codePoint: 0xe612, color: Colors.red, size: 28),
      label: '视频',
    ),
    const BottomNavigationBarItem(
      icon: IconFont(codePoint: 0xe624, size: 28),
      activeIcon: IconFont(codePoint: 0xe624, color: Colors.red, size: 28),
      label: '我的',
    ),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _page,keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: _buildWidget(),
      onWillPop: () async {
        if (lastPopTime == null ||
            DateTime.now().difference(lastPopTime!) >
                const Duration(seconds: 2)) {
          // 存储当前按下back键的时间
          lastPopTime = DateTime.now();
          // toast
          showToast("再按一次退出app");
          return false;
        } else {
          lastPopTime = DateTime.now();
          // 退出app
          await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return true;
        }
      },
    );
  }

  Widget _buildWidget() {
    return Scaffold(
      key: Provider.of<AppProvider>(context,listen: false).scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom:  ScreenUtil().setWidth(110)),
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                onPageChanged: handlePageChanged,
                children: [
                  DiscoverPage(),
                  TrendPage(),
                  VideoPage(),
                  MyPage(),
                ],
              ),
            ),
            PlayWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomTabs,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        onTap: handleNavBarTap,
        backgroundColor: Colors.white,
        elevation: 0,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        selectedItemColor: Colors.red,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('个人中心'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Flutter 中文社区'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('退出登录'),
              onTap: () async {},
            ),
          ],
        ),
      ),
    );
  }
}
