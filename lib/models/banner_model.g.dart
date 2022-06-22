// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => BannerModel(
      (json['banners'] as List<dynamic>)
          .map((e) => Banners.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BannerModelToJson(BannerModel instance) =>
    <String, dynamic>{
      'banners': instance.banners,
    };

Banners _$BannersFromJson(Map<String, dynamic> json) => Banners(
      json['bannerId'] as String?,
      json['pic'] as String,
      json['titleColor'] as String,
      json['requestId'] as String?,
      json['exclusive'] as bool,
      json['targetId'] as int,
      json['song'] == null
          ? null
          : SongModel.fromJson(json['song'] as Map<String, dynamic>),
      json['showAdTag'] as bool,
      json['targetType'] as int,
      json['typeTitle'] as String,
      json['encodeId'] as String,
    );

Map<String, dynamic> _$BannersToJson(Banners instance) => <String, dynamic>{
      'bannerId': instance.bannerId,
      'pic': instance.pic,
      'titleColor': instance.titleColor,
      'requestId': instance.requestId,
      'exclusive': instance.exclusive,
      'targetId': instance.targetId,
      'song': instance.song,
      'showAdTag': instance.showAdTag,
      'targetType': instance.targetType,
      'typeTitle': instance.typeTitle,
      'encodeId': instance.encodeId,
    };
