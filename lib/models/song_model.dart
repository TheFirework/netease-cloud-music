import 'package:json_annotation/json_annotation.dart';

part 'song_model.g.dart';

@JsonSerializable()
class SongModel extends Object {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'ar')
  List<Ar> ar;

  @JsonKey(name: 'alia')
  List<String> alia;

  @JsonKey(name: 'st')
  int st;

  @JsonKey(name: 'fee')
  int fee;

  @JsonKey(name: 'v')
  int v;

  @JsonKey(name: 'al')
  Al al;

  @JsonKey(name: 'copyright')
  int? copyright;

  @JsonKey(name: 'originCoverType')
  int? originCoverType;

  @JsonKey(name: 'originSongSimpleData')
  OriginSongSimpleData? originSongSimpleData;

  @JsonKey(name: 'mv')
  int? mv;

  @JsonKey(name: 'reason')
  String? reason;

  SongModel(
    this.name,
    this.id,
    this.ar,
    this.alia,
    this.st,
    this.fee,
    this.v,
    this.al,
    this.copyright,
    this.originCoverType,
    this.originSongSimpleData,
    this.mv,
    this.reason,
  );

  factory SongModel.fromJson(Map<String, dynamic> srcJson) =>
      _$SongModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SongModelToJson(this);
}

@JsonSerializable()
class Ar extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'tns')
  List<String>? tns;

  @JsonKey(name: 'alias')
  List<String>? alias;

  Ar(
    this.id,
    this.name,
    this.tns,
    this.alias,
  );

  factory Ar.fromJson(Map<String, dynamic> srcJson) => _$ArFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArToJson(this);
}

@JsonSerializable()
class Al extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'picUrl')
  String? picUrl;

  @JsonKey(name: 'tns')
  List<String>? tns;

  @JsonKey(name: 'pic_str')
  String? picStr;

  @JsonKey(name: 'pic')
  int? pic;

  Al(
    this.id,
    this.name,
    this.picUrl,
    this.tns,
    this.picStr,
    this.pic,
  );

  factory Al.fromJson(Map<String, dynamic> srcJson) => _$AlFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AlToJson(this);
}


@JsonSerializable()
class OriginSongSimpleData extends Object {

  @JsonKey(name: 'songId')
  int? songId;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'artists')
  List<Artists> artists;

  @JsonKey(name: 'albumMeta')
  AlbumMeta albumMeta;

  OriginSongSimpleData(this.songId,this.name,this.artists,this.albumMeta,);

  factory OriginSongSimpleData.fromJson(Map<String, dynamic> srcJson) => _$OriginSongSimpleDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OriginSongSimpleDataToJson(this);

}


@JsonSerializable()
class Artists extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  Artists(this.id,this.name,);

  factory Artists.fromJson(Map<String, dynamic> srcJson) => _$ArtistsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArtistsToJson(this);

}


@JsonSerializable()
class AlbumMeta extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  AlbumMeta(this.id,this.name,);

  factory AlbumMeta.fromJson(Map<String, dynamic> srcJson) => _$AlbumMetaFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AlbumMetaToJson(this);

}