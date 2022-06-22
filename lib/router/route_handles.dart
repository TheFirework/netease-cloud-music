import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music/pages/daily_songs/daily_songs_page.dart';
import 'package:netease_cloud_music/pages/home/home_page.dart';
import 'package:netease_cloud_music/pages/login/login_page.dart';
import 'package:netease_cloud_music/pages/splash/splash_page.dart';
import 'package:netease_cloud_music/utils/fluro_convert_utils.dart';


// splash 页面
var splashHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<Object>> params) {
  return SplashPage();
});

// 登录页
var loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<Object>> params) {
  return LoginPage();
});

// 跳转到主页
var homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<Object>> params) {
  return HomePage();
});

// 跳转到每日推荐歌曲
var dailySongsHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<Object>> params) {
  return DailySongsPage();
});

