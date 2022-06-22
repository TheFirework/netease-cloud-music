import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:netease_cloud_music/core/config/index.dart';
import 'package:path_provider/path_provider.dart';

class CookieCore{
  static  PersistCookieJar? _cookieJar;
  static Future<PersistCookieJar> get cookieJar async {
    if(_cookieJar == null){
      Directory tempDir = await getApplicationDocumentsDirectory();
      String tempPath = tempDir.path;
      _cookieJar = PersistCookieJar(ignoreExpires: true,storage: FileStorage(tempPath));
    }
   return _cookieJar!;
  }

  static Future<List<Cookie>> getCookie() async {
    PersistCookieJar cookieJar = await CookieCore.cookieJar;
    return cookieJar.loadForRequest(Uri.parse(Config.baseUrl));
  }

  static Future<void> setCookie(List<Cookie> cookies,String uri) async {
    PersistCookieJar cookieJar = await CookieCore.cookieJar;
    cookieJar.saveFromResponse(Uri.parse(uri), cookies);
  }
}
