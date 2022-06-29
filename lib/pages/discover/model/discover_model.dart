import 'package:json_annotation/json_annotation.dart';

import 'creative_model.dart';
import 'ui_element_model.dart';

part 'discover_model.g.dart';


@JsonSerializable()
class DiscoverModel extends Object {

  @JsonKey(name: 'cursor')
  String? cursor;

  @JsonKey(name: 'blocks')
  List<Blocks> blocks;

  @JsonKey(name: 'pageConfig')
  PageConfig pageConfig;

  @JsonKey(name: 'hasMore')
  bool? hasMore;

  DiscoverModel(this.cursor,this.blocks,this.pageConfig,this.hasMore);

  factory DiscoverModel.fromJson(Map<String, dynamic> srcJson) => _$DiscoverModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DiscoverModelToJson(this);

}


@JsonSerializable()
class Blocks extends Object {

  @JsonKey(name: 'blockCode')
  String blockCode;

  @JsonKey(name: 'showType')
  String showType;

  @JsonKey(name: 'dislikeShowType')
  int dislikeShowType;

  @JsonKey(name: 'extInfo')
  dynamic extInfo;

  @JsonKey(name: 'canClose')
  bool canClose;

  @JsonKey(name: 'blockStyle')
  int blockStyle;

  @JsonKey(name: 'uiElement')
  UiElementModel? uiElement;

  @JsonKey(name: 'creatives')
  List<CreativeModel>? creatives;

  Blocks(this.blockCode,this.showType,this.dislikeShowType,this.extInfo,this.canClose,this.blockStyle,this.uiElement,this.creatives,);

  factory Blocks.fromJson(Map<String, dynamic> srcJson) => _$BlocksFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BlocksToJson(this);

}

@JsonSerializable()
class PageConfig extends Object {

  @JsonKey(name: 'refreshToast')
  String? refreshToast;

  @JsonKey(name: 'nodataToast')
  String? nodataToast;

  @JsonKey(name: 'refreshInterval')
  int? refreshInterval;

  PageConfig(this.refreshToast,this.nodataToast,this.refreshInterval,);

  factory PageConfig.fromJson(Map<String, dynamic> srcJson) => _$PageConfigFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PageConfigToJson(this);

}


