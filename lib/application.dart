import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:netease_cloud_music/router/navigate_service.dart';
import 'package:netease_cloud_music/router/routes.dart';
import 'package:netease_cloud_music/utils/log_util.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/http/http.dart';

class Application {
  static late final FluroRouter router;
  static GlobalKey<NavigatorState> key = GlobalKey();
  static SharedPreferences? sp;
  static GetIt getIt = GetIt.instance;

  /// 设备宽度
  static double screenWidth = ScreenUtil().screenWidth;
  /// 设备高度
  static double screenHeight = ScreenUtil().screenHeight;
  /// 状态栏高度 刘海屏会更高
  static double statusBarHeight = ScreenUtil().statusBarHeight;

  static Future initApp() async {
    /// 运行初始化
    WidgetsFlutterBinding.ensureInitialized();
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
    getIt.registerSingleton(NavigateService());
    sp = await SharedPreferences.getInstance();
    LogUtil.init(tag: 'NETEASE_MUSIC');
    Http().init();
    Provider.debugCheckInvalidValueType = null;
  }

}
