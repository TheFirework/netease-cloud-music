import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  // 打开 drawer
  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  // 关闭 drawer
  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }
}