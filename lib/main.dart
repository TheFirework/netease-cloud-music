import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/pages/splash/splash_page.dart';
import 'package:netease_cloud_music/provider/app_provider.dart';
import 'package:netease_cloud_music/provider/discover_provider.dart';
import 'package:netease_cloud_music/provider/play_list_provider.dart';
import 'package:netease_cloud_music/provider/play_songs_provider.dart';
import 'package:netease_cloud_music/provider/user_provider.dart';
import 'package:netease_cloud_music/router/navigate_service.dart';
import 'package:netease_cloud_music/theme/color.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'application.dart';

void main() => Application.initApp().then((value) => runApp(MusicApp()));

class MusicApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    if (Platform.isAndroid) {
      const SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
    if (Platform.isIOS) {
      const SystemUiOverlayStyle dark = SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFF000000),
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      );
      SystemChrome.setSystemUIOverlayStyle(dark);
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => PlaySongsProvider()..init()),
        ChangeNotifierProvider(create: (context) => PlayListProvider()),
        ChangeNotifierProvider(create: (context) => DiscoverProvider(),lazy: true,),
      ],
      child: ScreenUtilInit(
        designSize: const Size(750, 1334),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return RefreshConfiguration(
            headerBuilder: () => const MaterialClassicHeader(
              color: AppColor.primaryColor,
              backgroundColor: Colors.white,
            ),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: Application.getIt<NavigateService>().key,
              title: '网易云音乐',
              theme: ThemeData(
                fontFamily: 'Montserrat',
                brightness: Brightness.light,
                primaryColor: Colors.white,
                splashColor: Colors.transparent,
                tooltipTheme: const TooltipThemeData(verticalOffset: -100000),
              ),
              home: child,
              onGenerateRoute: Application.router.generator,
            ),
          );
        },
        child: SplashPage(),
      ),
    );
  }
}

