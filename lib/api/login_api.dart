import 'package:netease_cloud_music/core/http/index.dart';
import 'package:netease_cloud_music/utils/toast.dart';

class LoginApi {
  /// 手机号登陆
  static login(String phone, String password) async {
    var response = await Http().request(
      method: "POST",
      url: '/login/cellphone',
      data: {
        'phone': phone,
        'password': password,
      },
    );
    return response.data;
  }

  /// 退出登陆
  static logout() async {
    var response = await Http().request(
      method: "POST",
      url: '/logout',
    );
    // 清除缓存
    return response.result;
  }

  static Future refreshLogin() async {
    return await Http().request(url: '/login/refresh').catchError((e) {
      showToast('网络错误！');
    });
  }
}
