// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ball_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BallModel _$BallModelFromJson(Map<String, dynamic> json) => BallModel(
      (json['data'] as List<dynamic>)
          .map((e) => Ball.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BallModelToJson(BallModel instance) => <String, dynamic>{
      'data': instance.data,
    };

Ball _$BallFromJson(Map<String, dynamic> json) => Ball(
      json['id'] as int,
      json['name'] as String,
      json['iconUrl'] as String,
      json['url'] as String,
      json['skinSupport'] as bool,
      json['homepageMode'] as String,
    );

Map<String, dynamic> _$BallToJson(Ball instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconUrl': instance.iconUrl,
      'url': instance.url,
      'skinSupport': instance.skinSupport,
      'homepageMode': instance.homepageMode,
    };
