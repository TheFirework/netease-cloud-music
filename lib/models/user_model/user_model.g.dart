// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['loginType'] as int,
      json['code'] as int,
      Account.fromJson(json['account'] as Map<String, dynamic>),
      json['token'] as String,
      Profile.fromJson(json['profile'] as Map<String, dynamic>),
      (json['bindings'] as List<dynamic>)
          .map((e) => Bindings.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['cookie'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'loginType': instance.loginType,
      'code': instance.code,
      'account': instance.account,
      'token': instance.token,
      'profile': instance.profile,
      'bindings': instance.bindings,
      'cookie': instance.cookie,
    };

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      json['id'] as int,
      json['userName'] as String,
      json['type'] as int,
      json['status'] as int,
      json['whitelistAuthority'] as int,
      json['createTime'] as int,
      json['salt'] as String,
      json['tokenVersion'] as int,
      json['ban'] as int,
      json['baoyueVersion'] as int,
      json['donateVersion'] as int,
      json['vipType'] as int,
      json['viptypeVersion'] as int,
      json['anonimousUser'] as bool,
      json['uninitialized'] as bool,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'type': instance.type,
      'status': instance.status,
      'whitelistAuthority': instance.whitelistAuthority,
      'createTime': instance.createTime,
      'salt': instance.salt,
      'tokenVersion': instance.tokenVersion,
      'ban': instance.ban,
      'baoyueVersion': instance.baoyueVersion,
      'donateVersion': instance.donateVersion,
      'vipType': instance.vipType,
      'viptypeVersion': instance.viptypeVersion,
      'anonimousUser': instance.anonimousUser,
      'uninitialized': instance.uninitialized,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      json['backgroundImgIdStr'] as String,
      json['avatarImgIdStr'] as String,
      json['userId'] as int,
      json['userType'] as int,
      json['gender'] as int,
      json['vipType'] as int,
      json['accountStatus'] as int,
      json['avatarImgId'] as int,
      json['nickname'] as String,
      json['backgroundImgId'] as int,
      json['birthday'] as int,
      json['city'] as int,
      json['avatarUrl'] as String,
      json['defaultAvatar'] as bool,
      json['province'] as int,
      Experts.fromJson(json['experts'] as Map<String, dynamic>),
      json['mutual'] as bool,
      json['authStatus'] as int,
      json['djStatus'] as int,
      json['followed'] as bool,
      json['backgroundUrl'] as String,
      json['detailDescription'] as String,
      json['description'] as String,
      json['signature'] as String,
      json['authority'] as int,
      json['followeds'] as int,
      json['follows'] as int,
      json['eventCount'] as int,
      json['playlistCount'] as int,
      json['playlistBeSubscribedCount'] as int,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'backgroundImgIdStr': instance.backgroundImgIdStr,
      'avatarImgIdStr': instance.avatarImgIdStr,
      'userId': instance.userId,
      'userType': instance.userType,
      'gender': instance.gender,
      'vipType': instance.vipType,
      'accountStatus': instance.accountStatus,
      'avatarImgId': instance.avatarImgId,
      'nickname': instance.nickname,
      'backgroundImgId': instance.backgroundImgId,
      'birthday': instance.birthday,
      'city': instance.city,
      'avatarUrl': instance.avatarUrl,
      'defaultAvatar': instance.defaultAvatar,
      'province': instance.province,
      'experts': instance.experts,
      'mutual': instance.mutual,
      'authStatus': instance.authStatus,
      'djStatus': instance.djStatus,
      'followed': instance.followed,
      'backgroundUrl': instance.backgroundUrl,
      'detailDescription': instance.detailDescription,
      'description': instance.description,
      'signature': instance.signature,
      'authority': instance.authority,
      'followeds': instance.followeds,
      'follows': instance.follows,
      'eventCount': instance.eventCount,
      'playlistCount': instance.playlistCount,
      'playlistBeSubscribedCount': instance.playlistBeSubscribedCount,
    };

Experts _$ExpertsFromJson(Map<String, dynamic> json) => Experts();

Map<String, dynamic> _$ExpertsToJson(Experts instance) => <String, dynamic>{};

Bindings _$BindingsFromJson(Map<String, dynamic> json) => Bindings(
      json['userId'] as int,
      json['url'] as String,
      json['expired'] as bool,
      json['bindingTime'] as int,
      json['tokenJsonStr'] as String,
      json['expiresIn'] as int,
      json['refreshTime'] as int,
      json['id'] as int,
      json['type'] as int,
    );

Map<String, dynamic> _$BindingsToJson(Bindings instance) => <String, dynamic>{
      'userId': instance.userId,
      'url': instance.url,
      'expired': instance.expired,
      'bindingTime': instance.bindingTime,
      'tokenJsonStr': instance.tokenJsonStr,
      'expiresIn': instance.expiresIn,
      'refreshTime': instance.refreshTime,
      'id': instance.id,
      'type': instance.type,
    };
