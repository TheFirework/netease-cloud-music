import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/models/banner_model.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:netease_cloud_music/widgets/banner_pagination_builder.dart';

class DiscoverBanner extends StatelessWidget {
  final BannerModel bannerModel;

  const DiscoverBanner({Key? key, required this.bannerModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(280),
      child: Swiper(
        itemCount: bannerModel.banners.length,
        itemBuilder: (context, index) {
          return _buildItem(index);
        },
        index: 0,
        autoplay: true,
        onTap: (index) {},
        pagination: bannerModel.banners.length > 1
            ? SwiperPagination(
                builder: BannerPaginationBuilder(
                  color: Colors.white.withAlpha(80),
                  size: const Size(14, 3),
                  activeSize: const Size(14, 3),
                  space: 4,
                  activeColor: Colors.white,
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildItem(int index) {
    final banner = bannerModel.banners[index];
    return GestureDetector(
      onTap: () {
        /// targetType 1:新歌 10:新碟
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
          child: CachedNetworkImage(
            imageUrl: banner.pic,
            fit: BoxFit.cover,
            imageBuilder: (context, imageProvider) {
              return Stack(
                children: [
                  Positioned.fill(
                    child: Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: ScreenUtil().setWidth(40),
                      decoration: BoxDecoration(
                        color: banner.titleColor == "red"
                            ? Colors.red
                            : Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            ScreenUtil().setWidth(10),
                          ),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(10),),
                      child: Center(
                        child: Text(
                          banner.typeTitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
