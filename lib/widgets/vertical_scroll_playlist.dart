import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/pages/discover/model/creative_model.dart';
import 'package:netease_cloud_music/provider/discover_provider.dart';
import 'package:netease_cloud_music/widgets/gap.dart';
import 'package:provider/provider.dart';

class VerticalScrollPlaylist extends StatefulWidget {
  final List<Resources> list;

  const VerticalScrollPlaylist({Key? key, required this.list})
      : super(key: key);

  @override
  State<VerticalScrollPlaylist> createState() => _VerticalScrollPlaylistState();
}

class _VerticalScrollPlaylistState extends State<VerticalScrollPlaylist> {
  SwiperController controller = SwiperController();

  double width = ScreenUtil().setWidth(200);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: width,
        child: Column(
          children: [
            _buildCover(),
            Gap(height: 10),
            Consumer<DiscoverProvider>(builder: (context, value, child) {
              String? title = widget.list.first.uiElement.mainTitle?.title;
              return Text(
                value.title ?? "$title",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(18),
                  color: Colors.black87,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  _buildCover() {
    return Stack(
      children: [
        Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
            border: Border.all(
              color: Colors.grey.shade300,
              width: ScreenUtil().setWidth(1),
            ),
          ),
          child: SizedBox.shrink(),
        ),
        Positioned.fill(
          child: Swiper(
            index: 0,
            itemCount: widget.list.length,
            itemBuilder: (context, index) {
              final resource = widget.list.elementAt(index);
              return ClipRRect(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
                child: CachedNetworkImage(
                  width: width,
                  height: width,
                  imageUrl:
                      '${resource.uiElement.image?.imageUrl}?param=200y200',
                  imageBuilder: (image, imageProvider) {
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                ScreenUtil().setWidth(10)),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: ScreenUtil().setWidth(1),
                            ),
                          ),
                          child: Image(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: ScreenUtil().setWidth(8),
                          child: Image.asset(
                            'assets/images/icon_meta.png',
                            width: ScreenUtil().setWidth(50),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
            onIndexChanged: (index) {
              final resources = widget.list.elementAt(index);
              Provider.of<DiscoverProvider>(context, listen: false)
                  .setResources(resources);
            },
            controller: controller,
            scrollDirection: Axis.vertical,
            itemHeight: width,
            itemWidth: width,
            autoplay: true,
            autoplayDelay: 4000,
            duration: 600,
          ),
        ),
      ],
    );
  }
}
