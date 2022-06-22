import 'package:netease_cloud_music/core/http/index.dart';
import 'package:netease_cloud_music/core/values/constants.dart';
import 'package:netease_cloud_music/models/recommend_songs_model.dart';
import 'package:netease_cloud_music/pages/discover/model/discover_model.dart';

class DiscoverApi {
  /// 获取 APP 首页信息
  static Future<DiscoverModel?> getHomePage({bool refresh = false}) async {
    final response = await Http().request(
      url: '/homepage/block/page',
      params: {
        "refresh": refresh,
        'timestamp': DateTime.now().millisecondsSinceEpoch
      },
    );
    if (response.result) {
      DiscoverModel discoverModel =
          DiscoverModel.fromJson(response.data['data']);
      final ballList = await getHomePageBall();
      discoverModel.blocks.insert(
          1,
          Blocks(HomePageShowType.HOMEPAGE_BALL, HomePageShowType.HOMEPAGE_BALL,
              0, ballList, false, 0, null, null));
      return discoverModel;
    }
    return null;
  }

  /// 获取 APP 首页圆形图标入口列表
  static Future getHomePageBall() async {
    final response = await Http().request(url: '/homepage/dragon/ball');
    if (response.result) {
      return response.data['data'];
    }
    return null;
  }

  /// 每日推荐歌曲
  static Future<RecommendSongsModel> getDailySongs() async {
    var response = await Http().request(url: '/recommend/songs');
    return RecommendSongsModel.fromJson(response.data['data']);
  }
}
