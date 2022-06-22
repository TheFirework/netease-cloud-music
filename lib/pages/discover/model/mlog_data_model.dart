import 'package:json_annotation/json_annotation.dart';

part 'mlog_data_model.g.dart';

@JsonSerializable()
class MlogDataModel extends Object {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'mlogBaseDataType')
  int mlogBaseDataType;

  @JsonKey(name: 'resource')
  MlogResource resource;

  @JsonKey(name: 'reason')
  String reason;

  @JsonKey(name: 'sameCity')
  bool sameCity;

  MlogDataModel(
    this.id,
    this.type,
    this.mlogBaseDataType,
    this.resource,
    this.reason,
    this.sameCity,
  );

  factory MlogDataModel.fromJson(Map<String, dynamic> srcJson) =>
      _$MlogDataModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MlogDataModelToJson(this);
}

@JsonSerializable()
class MlogResource extends Object {
  @JsonKey(name: 'mlogBaseData')
  MlogBaseData mlogBaseData;

  @JsonKey(name: 'mlogExtVO')
  MlogExtVO mlogExtVO;

  @JsonKey(name: 'userProfile')
  MlogUserProfile userProfile;

  @JsonKey(name: 'shareUrl')
  String shareUrl;

  MlogResource(
    this.mlogBaseData,
    this.mlogExtVO,
    this.userProfile,
    this.shareUrl,
  );

  factory MlogResource.fromJson(Map<String, dynamic> srcJson) =>
      _$MlogResourceFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MlogResourceToJson(this);
}

@JsonSerializable()
class MlogBaseData extends Object {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'originalTitle')
  String originalTitle;

  @JsonKey(name: 'text')
  String text;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'pubTime')
  int pubTime;

  @JsonKey(name: 'coverUrl')
  String coverUrl;

  @JsonKey(name: 'duration')
  int duration;

  MlogBaseData(
    this.id,
    this.type,
    this.originalTitle,
    this.text,
    this.desc,
    this.pubTime,
    this.coverUrl,
    this.duration,
  );

  factory MlogBaseData.fromJson(Map<String, dynamic> srcJson) =>
      _$MlogBaseDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MlogBaseDataToJson(this);
}

@JsonSerializable()
class MlogExtVO extends Object {
  @JsonKey(name: 'likedCount')
  int likedCount;

  @JsonKey(name: 'commentCount')
  int commentCount;

  @JsonKey(name: 'playCount')
  int playCount;

  @JsonKey(name: 'song')
  MlogSong song;

  @JsonKey(name: 'canCollect')
  bool canCollect;

  MlogExtVO(
    this.likedCount,
    this.commentCount,
    this.playCount,
    this.song,
    this.canCollect,
  );

  factory MlogExtVO.fromJson(Map<String, dynamic> srcJson) =>
      _$MlogExtVOFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MlogExtVOToJson(this);
}

@JsonSerializable()
class MlogSong extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'coverUrl')
  String coverUrl;

  @JsonKey(name: 'duration')
  int duration;

  @JsonKey(name: 'artists')
  List<MlogArtists> artists;

  @JsonKey(name: 'albumName')
  String albumName;

  MlogSong(
    this.id,
    this.name,
    this.coverUrl,
    this.duration,
    this.artists,
    this.albumName,
  );

  factory MlogSong.fromJson(Map<String, dynamic> srcJson) =>
      _$MlogSongFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MlogSongToJson(this);
}

@JsonSerializable()
class MlogArtists extends Object {
  @JsonKey(name: 'artistId')
  int artistId;

  @JsonKey(name: 'artistName')
  String artistName;

  MlogArtists(
    this.artistId,
    this.artistName,
  );

  factory MlogArtists.fromJson(Map<String, dynamic> srcJson) =>
      _$MlogArtistsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MlogArtistsToJson(this);
}

@JsonSerializable()
class MlogUserProfile extends Object {
  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'avatarUrl')
  String avatarUrl;

  @JsonKey(name: 'followed')
  bool followed;

  @JsonKey(name: 'userType')
  int userType;

  @JsonKey(name: 'isAnchor')
  bool isAnchor;

  MlogUserProfile(
    this.userId,
    this.nickname,
    this.avatarUrl,
    this.followed,
    this.userType,
    this.isAnchor,
  );

  factory MlogUserProfile.fromJson(Map<String, dynamic> srcJson) =>
      _$MlogUserProfileFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MlogUserProfileToJson(this);
}
