class Movie {
  List<D>? d;
  String? q;
  int? v;

  Movie({this.d, this.q, this.v});

  Movie.fromJson(Map<String, dynamic> json) {
    if (json['d'] != null) {
      d = <D>[];
      json['d'].forEach((v) {
        d!.add(new D.fromJson(v));
      });
    }
    q = json['q'];
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.d != null) {
      data['d'] = this.d!.map((v) => v.toJson()).toList();
    }
    data['q'] = this.q;
    data['v'] = this.v;
    return data;
  }
}

class D {
  I? i;
  String? id;
  String? l;
  String? q;
  int? rank;
  String? s;
  List<V>? v;
  int? vt;
  int? y;
  String? yr;

  D(
      {this.i,
        this.id,
        this.l,
        this.q,
        this.rank,
        this.s,
        this.v,
        this.vt,
        this.y,
        this.yr});

  D.fromJson(Map<String, dynamic> json) {
    i = json['i'] != null ? new I.fromJson(json['i']) : null;
    id = json['id'];
    l = json['l'];
    q = json['q'];
    rank = json['rank'];
    s = json['s'];
    if (json['v'] != null) {
      v = <V>[];
      json['v'].forEach((v) {
        v!.add(new V.fromJson(v));
      });
    }
    vt = json['vt'];
    y = json['y'];
    yr = json['yr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.i != null) {
      data['i'] = this.i!.toJson();
    }
    data['id'] = this.id;
    data['l'] = this.l;
    data['q'] = this.q;
    data['rank'] = this.rank;
    data['s'] = this.s;
    if (this.v != null) {
      data['v'] = this.v!.map((v) => v.toJson()).toList();
    }
    data['vt'] = this.vt;
    data['y'] = this.y;
    data['yr'] = this.yr;
    return data;
  }
}

class I {
  int? height;
  String? imageUrl;
  int? width;

  I({this.height, this.imageUrl, this.width});

  I.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    imageUrl = json['imageUrl'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['imageUrl'] = this.imageUrl;
    data['width'] = this.width;
    return data;
  }
}

class V {
  I? i;
  String? id;
  String? l;
  String? s;

  V({this.i, this.id, this.l, this.s});

  V.fromJson(Map<String, dynamic> json) {
    i = json['i'] != null ? new I.fromJson(json['i']) : null;
    id = json['id'];
    l = json['l'];
    s = json['s'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.i != null) {
      data['i'] = this.i!.toJson();
    }
    data['id'] = this.id;
    data['l'] = this.l;
    data['s'] = this.s;
    return data;
  }
}
