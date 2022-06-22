import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';


@JsonSerializable()
class UserModel extends Object {

  @JsonKey(name: 'loginType')
  int loginType;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'account')
  Account account;

  @JsonKey(name: 'token')
  String token;

  @JsonKey(name: 'profile')
  Profile profile;

  @JsonKey(name: 'bindings')
  List<Bindings> bindings;

  @JsonKey(name: 'cookie')
  String cookie;

  UserModel(this.loginType,this.code,this.account,this.token,this.profile,this.bindings,this.cookie,);

  factory UserModel.fromJson(Map<String, dynamic> srcJson) => _$UserModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}


@JsonSerializable()
class Account extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'userName')
  String userName;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'whitelistAuthority')
  int whitelistAuthority;

  @JsonKey(name: 'createTime')
  int createTime;

  @JsonKey(name: 'salt')
  String salt;

  @JsonKey(name: 'tokenVersion')
  int tokenVersion;

  @JsonKey(name: 'ban')
  int ban;

  @JsonKey(name: 'baoyueVersion')
  int baoyueVersion;

  @JsonKey(name: 'donateVersion')
  int donateVersion;

  @JsonKey(name: 'vipType')
  int vipType;

  @JsonKey(name: 'viptypeVersion')
  int viptypeVersion;

  @JsonKey(name: 'anonimousUser')
  bool anonimousUser;

  @JsonKey(name: 'uninitialized')
  bool uninitialized;

  Account(this.id,this.userName,this.type,this.status,this.whitelistAuthority,this.createTime,this.salt,this.tokenVersion,this.ban,this.baoyueVersion,this.donateVersion,this.vipType,this.viptypeVersion,this.anonimousUser,this.uninitialized,);

  factory Account.fromJson(Map<String, dynamic> srcJson) => _$AccountFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AccountToJson(this);

}


@JsonSerializable()
class Profile extends Object {

  @JsonKey(name: 'backgroundImgIdStr')
  String backgroundImgIdStr;

  @JsonKey(name: 'avatarImgIdStr')
  String avatarImgIdStr;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'userType')
  int userType;

  @JsonKey(name: 'gender')
  int gender;

  @JsonKey(name: 'vipType')
  int vipType;

  @JsonKey(name: 'accountStatus')
  int accountStatus;

  @JsonKey(name: 'avatarImgId')
  int avatarImgId;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'backgroundImgId')
  int backgroundImgId;

  @JsonKey(name: 'birthday')
  int birthday;

  @JsonKey(name: 'city')
  int city;

  @JsonKey(name: 'avatarUrl')
  String avatarUrl;

  @JsonKey(name: 'defaultAvatar')
  bool defaultAvatar;

  @JsonKey(name: 'province')
  int province;

  @JsonKey(name: 'experts')
  Experts experts;

  @JsonKey(name: 'mutual')
  bool mutual;

  @JsonKey(name: 'authStatus')
  int authStatus;

  @JsonKey(name: 'djStatus')
  int djStatus;

  @JsonKey(name: 'followed')
  bool followed;

  @JsonKey(name: 'backgroundUrl')
  String backgroundUrl;

  @JsonKey(name: 'detailDescription')
  String detailDescription;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'signature')
  String signature;

  @JsonKey(name: 'authority')
  int authority;

  @JsonKey(name: 'followeds')
  int followeds;

  @JsonKey(name: 'follows')
  int follows;

  @JsonKey(name: 'eventCount')
  int eventCount;

  @JsonKey(name: 'playlistCount')
  int playlistCount;

  @JsonKey(name: 'playlistBeSubscribedCount')
  int playlistBeSubscribedCount;

  Profile(this.backgroundImgIdStr,this.avatarImgIdStr,this.userId,this.userType,this.gender,this.vipType,this.accountStatus,this.avatarImgId,this.nickname,this.backgroundImgId,this.birthday,this.city,this.avatarUrl,this.defaultAvatar,this.province,this.experts,this.mutual,this.authStatus,this.djStatus,this.followed,this.backgroundUrl,this.detailDescription,this.description,this.signature,this.authority,this.followeds,this.follows,this.eventCount,this.playlistCount,this.playlistBeSubscribedCount,);

  factory Profile.fromJson(Map<String, dynamic> srcJson) => _$ProfileFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

}


@JsonSerializable()
class Experts extends Object {

  Experts();

  factory Experts.fromJson(Map<String, dynamic> srcJson) => _$ExpertsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ExpertsToJson(this);

}


@JsonSerializable()
class Bindings extends Object {

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'expired')
  bool expired;

  @JsonKey(name: 'bindingTime')
  int bindingTime;

  @JsonKey(name: 'tokenJsonStr')
  String tokenJsonStr;

  @JsonKey(name: 'expiresIn')
  int expiresIn;

  @JsonKey(name: 'refreshTime')
  int refreshTime;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'type')
  int type;

  Bindings(this.userId,this.url,this.expired,this.bindingTime,this.tokenJsonStr,this.expiresIn,this.refreshTime,this.id,this.type,);

  factory Bindings.fromJson(Map<String, dynamic> srcJson) => _$BindingsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BindingsToJson(this);

}


