// To parse this JSON data, do
//
//     final ImageModel = ImageModelFromJson(jsonString);

import 'dart:convert';

List<ImageModel> ImageModelFromJson(String str) => List<ImageModel>.from(json.decode(str).map((x) => ImageModel.fromJson(x)));

String ImageModelToJson(List<ImageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImageModel {
    final String url;
    final bool isprimary;
    final String id;

    ImageModel({
        required this.url,
        required this.isprimary,
        required this.id,
    });

    factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        url: json["url"],
        isprimary: json["isprimary"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "isprimary": isprimary,
        "_id": id,
    };
}
