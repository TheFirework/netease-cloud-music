import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 错误提示样式的toast
void showWarnToast(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    backgroundColor: Colors.red,
    textColor: Colors.white,
  );
}

/// 普通提示样式的toast
void showToast(
  String text, {
  double? fontSize,
  Color? backgroundColor,
  Color? textColor,
}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    fontSize: fontSize,
    backgroundColor: backgroundColor,
    textColor: textColor,
  );
}
