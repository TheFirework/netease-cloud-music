import 'package:netease_cloud_music/core/http/index.dart';

class MusicApi {
  static Future<String?> getMusicUrl(id) async {
    String url = '';
    var response = await Http().request(url: '/song/url?id=$id');
    final list = response.data['data'] as List;
    if (list.isNotEmpty && list.first['url'] != null) {
      url = list.first['url'].toString();
      url = url.replaceFirst("http://", "https://");
    }
    return url;
  }
}
