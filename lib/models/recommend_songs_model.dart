class RecommendSongsModel {
  List<DailySongs>? dailySongs = [];

  RecommendSongsModel({this.dailySongs});

  RecommendSongsModel.fromJson(Map<String, dynamic> json) {
    if (json['dailySongs'] != null) {
      dailySongs = <DailySongs>[];
      json['dailySongs'].forEach((v) {
        dailySongs?.add(DailySongs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dailySongs'] = dailySongs?.map((v) => v.toJson()).toList();
    return data;
  }
}

class DailySongs {
  String? name;
  int? id;
  List<Ar>? ar;
  Al? al;
  int? mv;

  DailySongs({this.name, this.id, this.ar, this.al, this.mv});

  DailySongs.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];

    if (json['ar'] != null) {
      ar = <Ar>[];
      json['ar'].forEach((v) {
        ar!.add(Ar.fromJson(v));
      });
    }

    mv = json['mv'];

    al = json['al'] != null ? Al.fromJson(json['al']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;

    if (ar != null) {
      data['ar'] = ar!.map((v) => v.toJson()).toList();
    }

    if (al != null) {
      data['al'] = al!.toJson();
    }

    return data;
  }
}

class Ar {
  int? id;
  String? name;
  List<String>? alias;

  Ar({this.id, this.name, this.alias});

  Ar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['alias'] != null) {
      alias = <String>[];
      json['alias'].forEach((v) {
        alias!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (alias != null) {
      data['alias'] = alias!.map((v) => v).toList();
    }
    return data;
  }
}

class Al {
  int? id;
  String? name;
  String? picUrl;
  String? picStr;
  int? pic;

  Al({this.id, this.name, this.picUrl,  this.picStr, this.pic});

  Al.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picUrl = json['picUrl'];
    picStr = json['pic_str'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['picUrl'] = picUrl;
    data['pic_str'] = picStr;
    data['pic'] = pic;
    return data;
  }
}
