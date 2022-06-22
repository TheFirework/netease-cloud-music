import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/provider/play_list_provider.dart';
import 'package:netease_cloud_music/provider/user_provider.dart';
import 'package:netease_cloud_music/utils/navigator_util.dart';
import 'package:netease_cloud_music/utils/toast.dart';
import 'package:netease_cloud_music/widgets/gap.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(80),
            right: ScreenUtil().setWidth(80),
            top: ScreenUtil().setWidth(30),
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Container(
              //   margin: EdgeInsets.only(top: ScreenUtil().setWidth(30)),
              //   child: const Text(
              //     'Welcome Back!',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       color: Colors.black87,
              //       fontSize: 32,
              //     ),
              //   ),
              // ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtil().setWidth(3)),
                child: const Text(
                  'The Flutter Netease Cloud Music App',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              Gap(height: 50),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: '请输入手机号',
                  prefixIcon: Icon(
                    Icons.phone_iphone,
                    color: Colors.grey,
                  ),
                ),
              ),
              Gap(height: 40),
              TextField(
                obscureText: true,
                controller: _pwdController,
                decoration: const InputDecoration(
                  hintText: '请输入密码',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                ),
              ),
              Gap(height: 40),
              Consumer<UserProvider>(
                builder:
                    (BuildContext context, UserProvider value, Widget? child) {
                  return Container(
                    // width: 250,
                    height: 50,
                    child: MaterialButton(
                      color: Colors.red,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      onPressed: () {
                        String phone = _phoneController.text;
                        String password = _pwdController.text;
                        if (phone.isEmpty || password.isEmpty) {
                          showToast('请输入手机号或密码');
                          return;
                        }
                        value.login(context, phone, password).then((value) {
                          if (value != null) {
                            Provider.of<PlayListProvider>(context,listen: false).user = value;
                            NavigatorUtil.goHomePage(context);
                          }
                        });
                      },
                      child:Container(
                        width: double.infinity,
                        child:  const Text(
                          '登录',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
