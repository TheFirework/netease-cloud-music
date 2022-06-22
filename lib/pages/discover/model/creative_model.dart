import 'package:json_annotation/json_annotation.dart';
import 'package:netease_cloud_music/models/song_model.dart';

import 'ui_element_model.dart';

part 'creative_model.g.dart';

@JsonSerializable()
class CreativeModel extends Object {
  @JsonKey(name: 'creativeType')
  String? creativeType;

  @JsonKey(name: 'creativeId')
  String? creativeId;

  @JsonKey(name: 'uiElement')
  UiElementModel? uiElement;

  @JsonKey(name: 'creativeExtInfoVO')
  CreativeExtInfoVO? creativeExtInfoVO;

  @JsonKey(name: 'resources')
  List<Resources>? resources;

  CreativeModel(
    this.creativeType,
    this.creativeId,
    this.uiElement,
    this.creativeExtInfoVO,
    this.resources,
  );

  factory CreativeModel.fromJson(Map<String, dynamic> srcJson) =>
      _$CreativeModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CreativeModelToJson(this);
}

@JsonSerializable()
class CreativeExtInfoVO extends Object {
  @JsonKey(name: 'playCount')
  int playCount;

  CreativeExtInfoVO(
    this.playCount,
  );

  factory CreativeExtInfoVO.fromJson(Map<String, dynamic> srcJson) =>
      _$CreativeExtInfoVOFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CreativeExtInfoVOToJson(this);
}

@JsonSerializable()
class Resources extends Object {
  @JsonKey(name: 'uiElement')
  UiElementModel uiElement;

  @JsonKey(name: 'resourceType')
  String? resourceType;

  @JsonKey(name: 'resourceId')
  String? resourceId;

  @JsonKey(name: 'resourceExtInfo')
  ResourceExtInfo? resourceExtInfo;

  @JsonKey(name: 'action')
  String? action;

  @JsonKey(name: 'actionType')
  String? actionType;

  @JsonKey(name: 'valid')
  bool valid;

  Resources(
    this.uiElement,
    this.resourceType,
    this.resourceId,
    this.resourceExtInfo,
    this.action,
    this.actionType,
    this.valid,
  );

  factory Resources.fromJson(Map<String, dynamic> srcJson) =>
      _$ResourcesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResourcesToJson(this);
}

@JsonSerializable()
class ResourceExtInfo extends Object {
  @JsonKey(name: 'playCount')
  int? playCount;

  @JsonKey(name: 'highQuality')
  bool? highQuality;

  @JsonKey(name: 'specialCover')
  int? specialCover;

  @JsonKey(name: 'specialType')
  int? specialType;

  @JsonKey(name: 'startTime')
  int? startTime;

  @JsonKey(name: 'endTime')
  int? endTime;

  @JsonKey(name: 'subed')
  bool? subed;

  @JsonKey(name: 'subCount')
  int? subCount;

  @JsonKey(name: 'canSubscribe')
  bool? canSubscribe;

  @JsonKey(name: 'tags')
  List<String>? tags;

  @JsonKey(name: 'users')
  List<UserInfo>? users;

  @JsonKey(name: 'song')
  SongModel? song;

  ResourceExtInfo(
    this.playCount,
    this.highQuality,
    this.specialCover,
    this.specialType,
    this.users,
    this.song,
  );

  factory ResourceExtInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$ResourceExtInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResourceExtInfoToJson(this);
}

@JsonSerializable()
class UserInfo extends Object {
  @JsonKey(name: 'followed')
  bool followed;

  @JsonKey(name: 'avatarUrl')
  String avatarUrl;

  @JsonKey(name: 'gender')
  int gender;

  @JsonKey(name: 'birthday')
  int birthday;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'signature')
  String? signature;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'detailDescription')
  String? detailDescription;

  @JsonKey(name: 'backgroundUrl')
  String? backgroundUrl;

  @JsonKey(name: 'remarkName')
  String? remarkName;

  @JsonKey(name: 'avatarDetail')
  AvatarDetail? avatarDetail;

  UserInfo(
    this.followed,
    this.avatarUrl,
    this.gender,
    this.birthday,
    this.userId,
    this.nickname,
    this.signature,
    this.description,
    this.detailDescription,
    this.backgroundUrl,
    this.remarkName,
    this.avatarDetail,
  );

  factory UserInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$UserInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}

@JsonSerializable()
class AvatarDetail extends Object {
  @JsonKey(name: 'userType')
  int userType;

  @JsonKey(name: 'identityLevel')
  int identityLevel;

  @JsonKey(name: 'identityIconUrl')
  String identityIconUrl;

  AvatarDetail(this.userType, this.identityIconUrl, this.identityLevel);

  factory AvatarDetail.fromJson(Map<String, dynamic> srcJson) =>
      _$AvatarDetailFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AvatarDetailToJson(this);
}
