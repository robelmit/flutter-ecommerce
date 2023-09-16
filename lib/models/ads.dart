// To parse this JSON data, do
//
//     final Ads = AdsFromJson(jsonString);

import 'dart:convert';

List<Ads> AdsPro(String str) =>
    List<Ads>.from(json.decode(str).map((x) => Ads.fromJson(x)));
// toRawJson() => json.encode(Ads.);
class Ads {
  String? id;
  String? title;
  String? catagory;
  String? postedby;
  String? description;
  String? price;
  List<Image>? images;
  List<dynamic>? favourites;
  String? postedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Ads({
    required this.id,
    required this.title,
    required this.catagory,
    this.postedby,
    required this.description,
    required this.price,
    required this.images,
    required this.favourites,
    this.postedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Ads.fromJson(Map<String, dynamic> json) => Ads(
        id: json["_id"],
        title: json["title"],
        catagory: json["catagory"],
        postedby: json["postedby"],
        description: json["description"],
        price: json["price"].toString(),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        favourites: List<dynamic>.from(json["favourites"].map((x) => x)),
        postedBy: json["postedBy"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "catagory": catagory,
        "postedby": postedby,
        "description": description,
        "price": price,
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "favourites": List<dynamic>.from(favourites!.map((x) => x)),
        "postedBy": postedBy,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Image {
  String id;
  bool isprimary;
  String url;

  Image({
    required this.id,
    required this.isprimary,
    required this.url,
  });

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["_id"],
        isprimary: json["isprimary"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "isprimary": isprimary,
        "url": url,
      };
}
