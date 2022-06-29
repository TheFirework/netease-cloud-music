import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keframe/keframe.dart';
import 'package:netease_cloud_music/api/discover_api.dart';
import 'package:netease_cloud_music/application.dart';
import 'package:netease_cloud_music/core/values/constants.dart';
import 'package:netease_cloud_music/models/banner_model.dart';
import 'package:netease_cloud_music/pages/discover/model/ball_model.dart';
import 'package:netease_cloud_music/provider/discover_provider.dart';
import 'package:netease_cloud_music/widgets/gap.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'model/discover_model.dart';
import 'widget/discover_appbar.dart';
import 'widget/discover_ball.dart';
import 'widget/discover_banner.dart';
import 'widget/discover_slide_playable_mlog.dart';
import 'widget/discover_slide_playlist.dart';
import 'widget/discover_slide_songlist_align.dart';
import 'widget/hot_topic.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  RefreshController refreshController = RefreshController();
  List<Blocks> blocks = [];

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  Future<DiscoverModel?> getHomePageWidgetList({bool refresh = false}) async {
    var cacheData = Application.sp?.getString(HOME_PAGE_DATA);
    DiscoverModel? discoverModel;
    if (cacheData != null) {
      discoverModel = DiscoverModel.fromJson(json.decode(cacheData));
    }
    final result = await DiscoverApi.getHomePage(
      refresh: refresh,
      cursor: discoverModel?.cursor,
    );
    return result;
  }

  Future<void> _onRefresh() async {
    print('刷新');
    DiscoverModel? discoverModel = await getHomePageWidgetList(refresh: true);
    if (discoverModel != null) {
      final ballList = await DiscoverApi.getHomePageBall();
      discoverModel.blocks.insert(
        1,
        Blocks(HomePageShowType.HOMEPAGE_BALL, HomePageShowType.HOMEPAGE_BALL,
            0, ballList, false, 0, null, null),
      );
      setState(() {
        blocks = discoverModel.blocks;
      });
    }
    refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: DiscoverAppBar(),
      backgroundColor: const Color(0xFFF3F3F3),
      body: _buildContent(),
    );
  }

  @override
  bool get wantKeepAlive => true;

  _buildContent() {
    return SmartRefresher(
      controller: refreshController,
      onRefresh: _onRefresh,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
        itemBuilder: (context, index) {
          return FrameSeparateWidget(
            index: index,
            child: _buildItem(blocks[index], index),
          );
        },
        separatorBuilder: (context, index) {
          return _buildGap(blocks[index].showType);
        },
        itemCount: blocks.length,
      ),
    );
  }

  Widget _buildGap(type) {
    switch (type) {
      case HomePageShowType.BANNER:
        return Container();
      case HomePageShowType.HOMEPAGE_BALL:
        return const Divider(
          height: 1,
        );
      default:
        return Gap(
          height: 20,
        );
    }
  }

  _buildItem(Blocks block, int index) {
    switch (block.showType) {
      case HomePageShowType.BANNER:
        return DiscoverBanner(
          bannerModel: BannerModel.fromJson(block.extInfo),
        );
      case HomePageShowType.HOMEPAGE_BALL:
        return DiscoverBall(
          ballList:
              (block.extInfo as List).map((e) => Ball.fromJson(e)).toList(),
        );
      case HomePageShowType.HOMEPAGE_SLIDE_PLAYLIST:
        return DiscoverSlidePlaylist(
          radius: false,
          uiElementModel: block.uiElement!,
          creatives: block.creatives!,
        );
      case HomePageShowType.HOMEPAGE_SLIDE_SONGLIST_ALIGN:
        return DiscoverSlideSonglistAlign(
          uiElementModel: block.uiElement!,
          creatives: block.creatives!,
        );
      case HomePageShowType.HOMEPAGE_SLIDE_PLAYABLE_MLOG:
        return DiscoverSlidePlayableMlog(blocks: block);
      case HomePageShowType.HOMEPAGE_SLIDE_LISTEN_LIVE:
        return Container(
          child: Text('直播'),
        );
      case HomePageShowType.HOMEPAGE_NEW_SONG_NEW_ALBUM:
        return Container(
          child: Text('新歌'),
        );
      case HomePageShowType.HOT_TOPIC:
        return HotTopic(
          uiElementModel: block.uiElement!,
          creatives: block.creatives!,
        );
      case HomePageShowType.SHUFFLE_MUSIC_CALENDAR:
        return Container(
          child: Text('音乐日历'),
        );
      case HomePageShowType.SLIDE_RCMDLIKE_VOICELIST:
        return Container(
          child: Text('热门播客'),
        );
      case HomePageShowType.YUNCUN_PRODUCED:
        return Container(
          child: Text('云村出品'),
        );
      case HomePageShowType.SLIDE_PLAYABLE_DRAGON_BALL_NEW_BROADCAST:
        return Container(
          child: Text('广播'),
        );
      default:
        return Container();
    }
  }
}
