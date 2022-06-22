// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mlog_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MlogDataModel _$MlogDataModelFromJson(Map<String, dynamic> json) =>
    MlogDataModel(
      json['id'] as String,
      json['type'] as int,
      json['mlogBaseDataType'] as int,
      MlogResource.fromJson(json['resource'] as Map<String, dynamic>),
      json['reason'] as String,
      json['sameCity'] as bool,
    );

Map<String, dynamic> _$MlogDataModelToJson(MlogDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'mlogBaseDataType': instance.mlogBaseDataType,
      'resource': instance.resource,
      'reason': instance.reason,
      'sameCity': instance.sameCity,
    };

MlogResource _$MlogResourceFromJson(Map<String, dynamic> json) => MlogResource(
      MlogBaseData.fromJson(json['mlogBaseData'] as Map<String, dynamic>),
      MlogExtVO.fromJson(json['mlogExtVO'] as Map<String, dynamic>),
      MlogUserProfile.fromJson(json['userProfile'] as Map<String, dynamic>),
      json['shareUrl'] as String,
    );

Map<String, dynamic> _$MlogResourceToJson(MlogResource instance) =>
    <String, dynamic>{
      'mlogBaseData': instance.mlogBaseData,
      'mlogExtVO': instance.mlogExtVO,
      'userProfile': instance.userProfile,
      'shareUrl': instance.shareUrl,
    };

MlogBaseData _$MlogBaseDataFromJson(Map<String, dynamic> json) => MlogBaseData(
      json['id'] as String,
      json['type'] as int,
      json['originalTitle'] as String,
      json['text'] as String,
      json['desc'] as String,
      json['pubTime'] as int,
      json['coverUrl'] as String,
      json['duration'] as int,
    );

Map<String, dynamic> _$MlogBaseDataToJson(MlogBaseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'originalTitle': instance.originalTitle,
      'text': instance.text,
      'desc': instance.desc,
      'pubTime': instance.pubTime,
      'coverUrl': instance.coverUrl,
      'duration': instance.duration,
    };

MlogExtVO _$MlogExtVOFromJson(Map<String, dynamic> json) => MlogExtVO(
      json['likedCount'] as int,
      json['commentCount'] as int,
      json['playCount'] as int,
      MlogSong.fromJson(json['song'] as Map<String, dynamic>),
      json['canCollect'] as bool,
    );

Map<String, dynamic> _$MlogExtVOToJson(MlogExtVO instance) => <String, dynamic>{
      'likedCount': instance.likedCount,
      'commentCount': instance.commentCount,
      'playCount': instance.playCount,
      'song': instance.song,
      'canCollect': instance.canCollect,
    };

MlogSong _$MlogSongFromJson(Map<String, dynamic> json) => MlogSong(
      json['id'] as int,
      json['name'] as String,
      json['coverUrl'] as String,
      json['duration'] as int,
      (json['artists'] as List<dynamic>)
          .map((e) => MlogArtists.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['albumName'] as String,
    );

Map<String, dynamic> _$MlogSongToJson(MlogSong instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coverUrl': instance.coverUrl,
      'duration': instance.duration,
      'artists': instance.artists,
      'albumName': instance.albumName,
    };

MlogArtists _$MlogArtistsFromJson(Map<String, dynamic> json) => MlogArtists(
      json['artistId'] as int,
      json['artistName'] as String,
    );

Map<String, dynamic> _$MlogArtistsToJson(MlogArtists instance) =>
    <String, dynamic>{
      'artistId': instance.artistId,
      'artistName': instance.artistName,
    };

MlogUserProfile _$MlogUserProfileFromJson(Map<String, dynamic> json) =>
    MlogUserProfile(
      json['userId'] as int,
      json['nickname'] as String,
      json['avatarUrl'] as String,
      json['followed'] as bool,
      json['userType'] as int,
      json['isAnchor'] as bool,
    );

Map<String, dynamic> _$MlogUserProfileToJson(MlogUserProfile instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'avatarUrl': instance.avatarUrl,
      'followed': instance.followed,
      'userType': instance.userType,
      'isAnchor': instance.isAnchor,
    };
