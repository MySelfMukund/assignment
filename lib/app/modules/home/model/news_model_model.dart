// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  Meta? meta;
  List<NewsDataModel>? data;

  NewsModel({
    this.meta,
    this.data,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        meta: Meta.fromJson(json["meta"]),
        data: List<NewsDataModel>.from(
            json["data"].map((x) => NewsDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta!.toJson(),
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class NewsDataModel {
  String? uuid;
  String? title;
  String? description;
  String? keywords;
  String? snippet;
  String? url;
  String? imageUrl;
  String? language;
  DateTime? publishedAt;
  String? source;
  List<String>? categories;
  dynamic relevanceScore;

  NewsDataModel({
    this.uuid,
    this.title,
    this.description,
    this.keywords,
    this.snippet,
    this.url,
    this.imageUrl,
    this.language,
    this.publishedAt,
    this.source,
    this.categories,
    this.relevanceScore,
  });

  factory NewsDataModel.fromJson(Map<String, dynamic> json) => NewsDataModel(
        uuid: json["uuid"],
        title: json["title"],
        description: json["description"],
        keywords: json["keywords"],
        snippet: json["snippet"],
        url: json["url"],
        imageUrl: json["image_url"],
        language: json["language"],
        publishedAt: DateTime.parse(json["published_at"]),
        source: json["source"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        relevanceScore: json["relevance_score"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "title": title,
        "description": description,
        "keywords": keywords,
        "snippet": snippet,
        "url": url,
        "image_url": imageUrl,
        "language": language,
        "published_at": publishedAt!.toIso8601String(),
        "source": source,
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "relevance_score": relevanceScore,
      };
}

class Meta {
  int found;
  int returned;
  int limit;
  int page;

  Meta({
    required this.found,
    required this.returned,
    required this.limit,
    required this.page,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        found: json["found"],
        returned: json["returned"],
        limit: json["limit"],
        page: json["page"],
      );

  Map<String, dynamic> toJson() => {
        "found": found,
        "returned": returned,
        "limit": limit,
        "page": page,
      };
}

// class NewsModel {
//   List<String>? warnings;
//   Meta? meta;
//   List<Data>? data;
//
//   NewsModel({this.warnings, this.meta, this.data});
//
//   NewsModel.fromJson(Map<String, dynamic> json) {
//     warnings = json['warnings'].cast<String>();
//     meta = json['meta'] != null ? Meta?.fromJson(json['meta']) : null;
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data?.add(Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['warnings'] = warnings;
//     if (meta != null) {
//       data['meta'] = meta?.toJson();
//     }
//     if (data != null) {
//       data['data'] = data.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Meta {
//   int? found;
//   int? returned;
//   int? limit;
//   int? page;
//
//   Meta({this.found, this.returned, this.limit, this.page});
//
//   Meta.fromJson(Map<String, dynamic> json) {
//     found = json['found'];
//     returned = json['returned'];
//     limit = json['limit'];
//     page = json['page'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['found'] = found;
//     data['returned'] = returned;
//     data['limit'] = limit;
//     data['page'] = page;
//     return data;
//   }
// }
//
// class Data {
//   String? uuid;
//   String? title;
//   String? description;
//   String? keywords;
//   String? snippet;
//   String? url;
//   String? imageUrl;
//   String? language;
//   String? publishedAt;
//   String? source;
//   List<String>? categories;
//   dynamic relevanceScore;
//
//   Data(
//       {this.uuid,
//       this.title,
//       this.description,
//       this.keywords,
//       this.snippet,
//       this.url,
//       this.imageUrl,
//       this.language,
//       this.publishedAt,
//       this.source,
//       this.categories,
//       this.relevanceScore});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     uuid = json['uuid'];
//     title = json['title'];
//     description = json['description'];
//     keywords = json['keywords'];
//     snippet = json['snippet'];
//     url = json['url'];
//     imageUrl = json['image_url'];
//     language = json['language'];
//     publishedAt = json['published_at'];
//     source = json['source'];
//     categories = json['categories'].cast<String>();
//     relevanceScore = json['relevance_score'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['uuid'] = uuid;
//     data['title'] = title;
//     data['description'] = description;
//     data['keywords'] = keywords;
//     data['snippet'] = snippet;
//     data['url'] = url;
//     data['image_url'] = imageUrl;
//     data['language'] = language;
//     data['published_at'] = publishedAt;
//     data['source'] = source;
//     data['categories'] = categories;
//     data['relevance_score'] = relevanceScore;
//     return data;
//   }
// }
