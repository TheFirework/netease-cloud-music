// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creative_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreativeModel _$CreativeModelFromJson(Map<String, dynamic> json) =>
    CreativeModel(
      json['creativeType'] as String?,
      json['creativeId'] as String?,
      json['uiElement'] == null
          ? null
          : UiElementModel.fromJson(json['uiElement'] as Map<String, dynamic>),
      json['creativeExtInfoVO'] == null
          ? null
          : CreativeExtInfoVO.fromJson(
              json['creativeExtInfoVO'] as Map<String, dynamic>),
      (json['resources'] as List<dynamic>?)
          ?.map((e) => Resources.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreativeModelToJson(CreativeModel instance) =>
    <String, dynamic>{
      'creativeType': instance.creativeType,
      'creativeId': instance.creativeId,
      'uiElement': instance.uiElement,
      'creativeExtInfoVO': instance.creativeExtInfoVO,
      'resources': instance.resources,
    };

CreativeExtInfoVO _$CreativeExtInfoVOFromJson(Map<String, dynamic> json) =>
    CreativeExtInfoVO(
      json['playCount'] as int,
    );

Map<String, dynamic> _$CreativeExtInfoVOToJson(CreativeExtInfoVO instance) =>
    <String, dynamic>{
      'playCount': instance.playCount,
    };

Resources _$ResourcesFromJson(Map<String, dynamic> json) => Resources(
      UiElementModel.fromJson(json['uiElement'] as Map<String, dynamic>),
      json['resourceType'] as String?,
      json['resourceId'] as String?,
      json['resourceExtInfo'] == null
          ? null
          : ResourceExtInfo.fromJson(
              json['resourceExtInfo'] as Map<String, dynamic>),
      json['action'] as String?,
      json['actionType'] as String?,
      json['valid'] as bool,
    );

Map<String, dynamic> _$ResourcesToJson(Resources instance) => <String, dynamic>{
      'uiElement': instance.uiElement,
      'resourceType': instance.resourceType,
      'resourceId': instance.resourceId,
      'resourceExtInfo': instance.resourceExtInfo,
      'action': instance.action,
      'actionType': instance.actionType,
      'valid': instance.valid,
    };

ResourceExtInfo _$ResourceExtInfoFromJson(Map<String, dynamic> json) =>
    ResourceExtInfo(
      json['playCount'] as int?,
      json['highQuality'] as bool?,
      json['specialCover'] as int?,
      json['specialType'] as int?,
      (json['users'] as List<dynamic>?)
          ?.map((e) => UserInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['song'] == null
          ? null
          : SongModel.fromJson(json['song'] as Map<String, dynamic>),
    )
      ..startTime = json['startTime'] as int?
      ..endTime = json['endTime'] as int?
      ..subed = json['subed'] as bool?
      ..subCount = json['subCount'] as int?
      ..canSubscribe = json['canSubscribe'] as bool?
      ..tags =
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$ResourceExtInfoToJson(ResourceExtInfo instance) =>
    <String, dynamic>{
      'playCount': instance.playCount,
      'highQuality': instance.highQuality,
      'specialCover': instance.specialCover,
      'specialType': instance.specialType,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'subed': instance.subed,
      'subCount': instance.subCount,
      'canSubscribe': instance.canSubscribe,
      'tags': instance.tags,
      'users': instance.users,
      'song': instance.song,
    };

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      json['followed'] as bool,
      json['avatarUrl'] as String,
      json['gender'] as int,
      json['birthday'] as int,
      json['userId'] as int,
      json['nickname'] as String,
      json['signature'] as String?,
      json['description'] as String?,
      json['detailDescription'] as String?,
      json['backgroundUrl'] as String?,
      json['remarkName'] as String?,
      json['avatarDetail'] == null
          ? null
          : AvatarDetail.fromJson(json['avatarDetail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'followed': instance.followed,
      'avatarUrl': instance.avatarUrl,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'userId': instance.userId,
      'nickname': instance.nickname,
      'signature': instance.signature,
      'description': instance.description,
      'detailDescription': instance.detailDescription,
      'backgroundUrl': instance.backgroundUrl,
      'remarkName': instance.remarkName,
      'avatarDetail': instance.avatarDetail,
    };

AvatarDetail _$AvatarDetailFromJson(Map<String, dynamic> json) => AvatarDetail(
      json['userType'] as int,
      json['identityIconUrl'] as String,
      json['identityLevel'] as int,
    );

Map<String, dynamic> _$AvatarDetailToJson(AvatarDetail instance) =>
    <String, dynamic>{
      'userType': instance.userType,
      'identityLevel': instance.identityLevel,
      'identityIconUrl': instance.identityIconUrl,
    };
