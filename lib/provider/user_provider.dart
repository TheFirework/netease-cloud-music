import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netease_cloud_music/api/login_api.dart';
import 'package:netease_cloud_music/application.dart';
import 'package:netease_cloud_music/core/values/constants.dart';
import 'package:netease_cloud_music/models/user_model/user_model.dart';
import 'package:netease_cloud_music/utils/toast.dart';

class UserProvider with ChangeNotifier{
  UserModel? _user;

  UserModel? get user => _user;

  void initUser(){
    if(Application.sp!.containsKey(USER_LOGIN_PROFILE)){
      String? s = Application.sp!.getString(USER_LOGIN_PROFILE);
      _user = UserModel.fromJson(json.decode(s!));
    }
  }

  Future<UserModel?> login(BuildContext context,String phone,String password)async{
    final response = await LoginApi.login(phone, password);
    if(response['code'] != 200){
      showToast(response['message'] ??'登录失败，请检查账号密码');
      return null;
    }
    UserModel user  = UserModel.fromJson(response);
    showToast('登录成功');
    _saveUserInfo(user);
    return user;
  }

  /// 保存用户信息到 sp
  _saveUserInfo(UserModel user) {
    _user = user;
    Application.sp?.setString(USER_LOGIN_PROFILE, json.encode(user.toJson()));
  }
}