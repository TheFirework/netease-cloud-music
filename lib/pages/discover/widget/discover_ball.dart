import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/pages/discover/model/ball_model.dart';
import 'package:netease_cloud_music/theme/color.dart';
import 'package:netease_cloud_music/widgets/gap.dart';

class DiscoverBall extends StatelessWidget {
  final List<Ball> ballList;

  const DiscoverBall({Key? key, required this.ballList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(170),
      color: Colors.white,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _buildBall(ballList[index]);
        },
        separatorBuilder: (context, index) {
          return Gap(height: 48);
        },
        itemCount: ballList.length,
      ),
    );
  }

  Widget _buildBall(Ball ball) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                width: ScreenUtil().setWidth(90),
                height: ScreenUtil().setWidth(90),
                color: AppColor.primaryColor.withOpacity(0.05),
                child: CachedNetworkImage(
                  imageUrl: ball.iconUrl,
                  fadeInDuration: const Duration(),
                  imageBuilder: (context, imageProvider) {
                    return Stack(
                      children: [
                        Image(
                          image: imageProvider,
                          color: const Color.fromARGB(255, 238, 40, 39),
                        ),
                        if (ball.id == -1)
                          Container(
                            margin: EdgeInsets.only(
                              top: ScreenUtil().setWidth(10),
                            ),
                            child: Center(
                              child: Text(
                                DateTime.now().day.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: ScreenUtil().setSp(18),
                                ),
                              ),
                            ),
                          )
                      ],
                    );
                  },
                ),
              ),
            ),
            Gap(height: 10),
            Text(
              ball.name,
              style: TextStyle(
                color: Colors.black54,
                fontSize: ScreenUtil().setSp(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
