// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscoverModel _$DiscoverModelFromJson(Map<String, dynamic> json) =>
    DiscoverModel(
      json['cursor'] as String?,
      (json['blocks'] as List<dynamic>)
          .map((e) => Blocks.fromJson(e as Map<String, dynamic>))
          .toList(),
      PageConfig.fromJson(json['pageConfig'] as Map<String, dynamic>),
      json['hasMore'] as bool?,
    );

Map<String, dynamic> _$DiscoverModelToJson(DiscoverModel instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
      'blocks': instance.blocks,
      'pageConfig': instance.pageConfig,
      'hasMore': instance.hasMore,
    };

Blocks _$BlocksFromJson(Map<String, dynamic> json) => Blocks(
      json['blockCode'] as String,
      json['showType'] as String,
      json['dislikeShowType'] as int,
      json['extInfo'],
      json['canClose'] as bool,
      json['blockStyle'] as int,
      json['uiElement'] == null
          ? null
          : UiElementModel.fromJson(json['uiElement'] as Map<String, dynamic>),
      (json['creatives'] as List<dynamic>?)
          ?.map((e) => CreativeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlocksToJson(Blocks instance) => <String, dynamic>{
      'blockCode': instance.blockCode,
      'showType': instance.showType,
      'dislikeShowType': instance.dislikeShowType,
      'extInfo': instance.extInfo,
      'canClose': instance.canClose,
      'blockStyle': instance.blockStyle,
      'uiElement': instance.uiElement,
      'creatives': instance.creatives,
    };

PageConfig _$PageConfigFromJson(Map<String, dynamic> json) => PageConfig(
      json['refreshToast'] as String?,
      json['nodataToast'] as String?,
      json['refreshInterval'] as int?,
    );

Map<String, dynamic> _$PageConfigToJson(PageConfig instance) =>
    <String, dynamic>{
      'refreshToast': instance.refreshToast,
      'nodataToast': instance.nodataToast,
      'refreshInterval': instance.refreshInterval,
    };
