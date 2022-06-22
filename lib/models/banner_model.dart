import 'package:json_annotation/json_annotation.dart';
import 'package:netease_cloud_music/models/song_model.dart';

part 'banner_model.g.dart';

@JsonSerializable()
class BannerModel extends Object {
  @JsonKey(name: 'banners')
  List<Banners> banners;

  BannerModel(
    this.banners,
  );

  factory BannerModel.fromJson(Map<String, dynamic> srcJson) =>
      _$BannerModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannerModelToJson(this);
}

@JsonSerializable()
class Banners extends Object {

  @JsonKey(name: 'bannerId')
  String? bannerId;

  @JsonKey(name: 'pic')
  String pic;

  @JsonKey(name: 'titleColor')
  String titleColor;

  @JsonKey(name: 'requestId')
  String? requestId;

  @JsonKey(name: 'exclusive')
  bool exclusive;

  @JsonKey(name: 'targetId')
  int targetId;

  @JsonKey(name: 'song')
  SongModel? song;

  @JsonKey(name: 'showAdTag')
  bool showAdTag;

  @JsonKey(name: 'targetType')
  int targetType;

  @JsonKey(name: 'typeTitle')
  String typeTitle;

  @JsonKey(name: 'encodeId')
  String encodeId;

  Banners(this.bannerId,this.pic,this.titleColor,this.requestId,this.exclusive,this.targetId,this.song,this.showAdTag,this.targetType,this.typeTitle,this.encodeId,);

  factory Banners.fromJson(Map<String, dynamic> srcJson) => _$BannersFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannersToJson(this);

}

