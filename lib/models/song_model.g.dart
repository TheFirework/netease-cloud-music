// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongModel _$SongModelFromJson(Map<String, dynamic> json) => SongModel(
      json['name'] as String,
      json['id'] as int,
      (json['ar'] as List<dynamic>)
          .map((e) => Ar.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['alia'] as List<dynamic>).map((e) => e as String).toList(),
      json['st'] as int,
      json['fee'] as int,
      json['v'] as int,
      Al.fromJson(json['al'] as Map<String, dynamic>),
      json['copyright'] as int?,
      json['originCoverType'] as int?,
      json['originSongSimpleData'] == null
          ? null
          : OriginSongSimpleData.fromJson(
              json['originSongSimpleData'] as Map<String, dynamic>),
      json['mv'] as int?,
      json['reason'] as String?,
    );

Map<String, dynamic> _$SongModelToJson(SongModel instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'ar': instance.ar,
      'alia': instance.alia,
      'st': instance.st,
      'fee': instance.fee,
      'v': instance.v,
      'al': instance.al,
      'copyright': instance.copyright,
      'originCoverType': instance.originCoverType,
      'originSongSimpleData': instance.originSongSimpleData,
      'mv': instance.mv,
      'reason': instance.reason,
    };

Ar _$ArFromJson(Map<String, dynamic> json) => Ar(
      json['id'] as int,
      json['name'] as String?,
      (json['tns'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['alias'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ArToJson(Ar instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tns': instance.tns,
      'alias': instance.alias,
    };

Al _$AlFromJson(Map<String, dynamic> json) => Al(
      json['id'] as int,
      json['name'] as String?,
      json['picUrl'] as String?,
      (json['tns'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['pic_str'] as String?,
      json['pic'] as int?,
    );

Map<String, dynamic> _$AlToJson(Al instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'tns': instance.tns,
      'pic_str': instance.picStr,
      'pic': instance.pic,
    };

OriginSongSimpleData _$OriginSongSimpleDataFromJson(
        Map<String, dynamic> json) =>
    OriginSongSimpleData(
      json['songId'] as int?,
      json['name'] as String?,
      (json['artists'] as List<dynamic>)
          .map((e) => Artists.fromJson(e as Map<String, dynamic>))
          .toList(),
      AlbumMeta.fromJson(json['albumMeta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OriginSongSimpleDataToJson(
        OriginSongSimpleData instance) =>
    <String, dynamic>{
      'songId': instance.songId,
      'name': instance.name,
      'artists': instance.artists,
      'albumMeta': instance.albumMeta,
    };

Artists _$ArtistsFromJson(Map<String, dynamic> json) => Artists(
      json['id'] as int,
      json['name'] as String,
    );

Map<String, dynamic> _$ArtistsToJson(Artists instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

AlbumMeta _$AlbumMetaFromJson(Map<String, dynamic> json) => AlbumMeta(
      json['id'] as int,
      json['name'] as String,
    );

Map<String, dynamic> _$AlbumMetaToJson(AlbumMeta instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
