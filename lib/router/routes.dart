import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music/pages/login/login_page.dart';
import 'package:netease_cloud_music/router/route_handles.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String login = "/login";
  static String dailySongs = "/daily_songs";
  static String comment = "/comment";
  static String search = "/search";
  
  static void configureRoutes(FluroRouter router){
    router.notFoundHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return LoginPage();
    });
    router.define(root, handler: splashHandler);
    router.define(login, handler: loginHandler);
    router.define(home, handler: homeHandler);
    router.define(dailySongs, handler: dailySongsHandler);
  }
}