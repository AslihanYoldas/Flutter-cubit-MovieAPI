class MovieDetail {
  String? id;
  Title? title;
  Certificates? certificates;
  Ratings? ratings;
  List<String>? genres;
  String? releaseDate;
  PlotOutline? plotOutline;
  PlotSummary? plotSummary;

  MovieDetail(
      {this.id,
        this.title,
        this.certificates,
        this.ratings,
        this.genres,
        this.releaseDate,
        this.plotOutline,
        this.plotSummary});

  MovieDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    certificates = json['certificates'] != null
        ? new Certificates.fromJson(json['certificates'])
        : null;
    ratings =
    json['ratings'] != null ? new Ratings.fromJson(json['ratings']) : null;
    genres = json['genres'].cast<String>();
    releaseDate = json['releaseDate'];
    plotOutline = json['plotOutline'] != null
        ? new PlotOutline.fromJson(json['plotOutline'])
        : null;
    plotSummary = json['plotSummary'] != null
        ? new PlotSummary.fromJson(json['plotSummary'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.certificates != null) {
      data['certificates'] = this.certificates!.toJson();
    }
    if (this.ratings != null) {
      data['ratings'] = this.ratings!.toJson();
    }
    data['genres'] = this.genres;
    data['releaseDate'] = this.releaseDate;
    if (this.plotOutline != null) {
      data['plotOutline'] = this.plotOutline!.toJson();
    }
    if (this.plotSummary != null) {
      data['plotSummary'] = this.plotSummary!.toJson();
    }
    return data;
  }
}

class Title {
  String? type;
  String? id;
  Image? image;
  int? runningTimeInMinutes;
  String? nextEpisode;
  int? numberOfEpisodes;
  int? seriesEndYear;
  int? seriesStartYear;
  String? title;
  String? titleType;
  int? year;

  Title(
      {this.type,
        this.id,
        this.image,
        this.runningTimeInMinutes,
        this.nextEpisode,
        this.numberOfEpisodes,
        this.seriesEndYear,
        this.seriesStartYear,
        this.title,
        this.titleType,
        this.year});

  Title.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    id = json['id'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    runningTimeInMinutes = json['runningTimeInMinutes'];
    nextEpisode = json['nextEpisode'];
    numberOfEpisodes = json['numberOfEpisodes'];
    seriesEndYear = json['seriesEndYear'];
    seriesStartYear = json['seriesStartYear'];
    title = json['title'];
    titleType = json['titleType'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['id'] = this.id;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['runningTimeInMinutes'] = this.runningTimeInMinutes;
    data['nextEpisode'] = this.nextEpisode;
    data['numberOfEpisodes'] = this.numberOfEpisodes;
    data['seriesEndYear'] = this.seriesEndYear;
    data['seriesStartYear'] = this.seriesStartYear;
    data['title'] = this.title;
    data['titleType'] = this.titleType;
    data['year'] = this.year;
    return data;
  }
}

class Image {
  int? height;
  String? id;
  String? url;
  int? width;

  Image({this.height, this.id, this.url, this.width});

  Image.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    id = json['id'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['id'] = this.id;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}

class Certificates {
  List<US>? uS;

  Certificates({this.uS});

  Certificates.fromJson(Map<String, dynamic> json) {
    if (json['US'] != null) {
      uS = <US>[];
      json['US'].forEach((v) {
        uS!.add(new US.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.uS != null) {
      data['US'] = this.uS!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class US {
  String? certificate;
  String? country;

  US({this.certificate, this.country});

  US.fromJson(Map<String, dynamic> json) {
    certificate = json['certificate'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['certificate'] = this.certificate;
    data['country'] = this.country;
    return data;
  }
}

class Ratings {
  bool? canRate;
  double? rating;
  int? ratingCount;
  List<OtherRanks>? otherRanks;

  Ratings({this.canRate, this.rating, this.ratingCount, this.otherRanks});

  Ratings.fromJson(Map<String, dynamic> json) {
    canRate = json['canRate'];
    rating = json['rating'];
    ratingCount = json['ratingCount'];
    if (json['otherRanks'] != null) {
      otherRanks = <OtherRanks>[];
      json['otherRanks'].forEach((v) {
        otherRanks!.add(new OtherRanks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['canRate'] = this.canRate;
    data['rating'] = this.rating;
    data['ratingCount'] = this.ratingCount;
    if (this.otherRanks != null) {
      data['otherRanks'] = this.otherRanks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OtherRanks {
  String? id;
  String? label;
  int? rank;
  String? rankType;

  OtherRanks({this.id, this.label, this.rank, this.rankType});

  OtherRanks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    rank = json['rank'];
    rankType = json['rankType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['rank'] = this.rank;
    data['rankType'] = this.rankType;
    return data;
  }
}

class PlotOutline {
  String? id;
  String? text;

  PlotOutline({this.id, this.text});

  PlotOutline.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    return data;
  }
}

class PlotSummary {
  String? author;
  String? id;
  String? text;

  PlotSummary({this.author, this.id, this.text});

  PlotSummary.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    id = json['id'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['id'] = this.id;
    data['text'] = this.text;
    return data;
  }
}
