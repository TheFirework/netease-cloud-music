import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/api/discover_api.dart';
import 'package:netease_cloud_music/models/song_model.dart';
import 'package:netease_cloud_music/models/recommend_songs_model.dart';
import 'package:netease_cloud_music/provider/play_songs_provider.dart';
import 'package:netease_cloud_music/utils/date_util.dart';
import 'package:netease_cloud_music/utils/navigator_util.dart';
import 'package:netease_cloud_music/widgets/widget_music_list_item.dart';
import 'package:netease_cloud_music/widgets/widget_play.dart';
import 'package:netease_cloud_music/widgets/widget_play_list_app_bar.dart';
import 'package:provider/provider.dart';

class DailySongsPage extends StatefulWidget {
  const DailySongsPage({Key? key}) : super(key: key);

  @override
  State<DailySongsPage> createState() => _DailySongsPageState();
}

class _DailySongsPageState extends State<DailySongsPage> {
  final double _expandedHeight = ScreenUtil().setWidth(400);
  RecommendSongsModel list = RecommendSongsModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom:
                    ScreenUtil().setWidth(110) + ScreenUtil().bottomBarHeight,
              ),
              child: CustomScrollView(
                slivers: [
                  PlayListAppBarWidget(
                    expandedHeight: _expandedHeight,
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(40),
                          ),
                          margin: EdgeInsets.only(
                            bottom: ScreenUtil().setWidth(5),
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      '${DateUtil.formatDate(dateTime: DateTime.now(), format: 'dd')} ',
                                  style: const TextStyle(fontSize: 30),
                                ),
                                TextSpan(
                                  text:
                                      '/ ${DateUtil.formatDate(dateTime: DateTime.now(), format: 'MM')}',
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                          margin: EdgeInsets.only(
                              bottom: ScreenUtil().setWidth(20)),
                          child: const Text(
                            '根据你的音乐口味，为你推荐好音乐。',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                    backgroundImg: 'assets/images/bg_daily.png',
                    title: '每日推荐',
                    playOnTap: (value) {
                      playSongs(value, 0);
                    },
                  ),
                  FutureBuilder<RecommendSongsModel>(
                    future: DiscoverApi.getDailySongs(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return _buildList(snapshot.data!);
                      } else {
                        return SliverToBoxAdapter(
                          child: Container(
                            alignment: Alignment.center,
                            height: ScreenUtil().setWidth(200),
                            child: const CupertinoActivityIndicator(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            PlayWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildList(RecommendSongsModel recommendSongsModel) {
    list = recommendSongsModel;
    return Consumer<PlaySongsProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              var item = recommendSongsModel.dailySongs![index];
              return WidgetMusicListItem(
                picUrl: item.al?.picUrl,
                id: item.id,
                name: item.name,
                mvid: item.mv,
                onTap: () {
                  playSong(value, index);
                },
                artists:
                    "${item.ar?.map((v) => v.name).toList().join('/')} - ${item.al?.name}",
              );
            },
            childCount: recommendSongsModel.dailySongs?.length,
          ),
        );
      },
    );
  }

  void playSongs(PlaySongsProvider playSongsProvider, int index) {
    // playSongsProvider.playSongs(
    //   list.dailySongs!
    //       .map(
    //         (e) => SongModel(
    //             id: e.id,
    //             name: e.name,
    //             picUrl: e.al?.picUrl,
    //             artists: '${e.ar?.map((a) => a.name).toList().join('/')}'),
    //       )
    //       .toList(),
    //   index: index,
    // );
  }

  void playSong(PlaySongsProvider playSongsProvider, int index) {
    // var item = list.dailySongs![index];
    // SongModel song = SongModel(
    //     id: item.id,
    //     name: item.name,
    //     picUrl: item.al?.picUrl,
    //     artists: '${item.ar?.map((a) => a.name).toList().join('/')}');
    // playSongsProvider.playSong(song);
    // NavigatorUtil.goPlaySongsPage(context);
  }
}
