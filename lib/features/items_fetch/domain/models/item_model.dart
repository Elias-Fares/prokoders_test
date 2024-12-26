import 'dart:convert';

import 'package:prokoders_test/core/models/general_model.dart';

class ItemsModel extends GeneralModel {
  final List<Item>? items;

  ItemsModel({
    this.items,
  });

  ItemsModel copyWith({
    List<Item>? items,
  }) =>
      ItemsModel(
        items: items ?? this.items,
      );

  factory ItemsModel.fromRawJson(String str) =>
      ItemsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ItemsModel.fromJson(Map<String, dynamic> json) => ItemsModel(
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };

  @override
  GeneralModel fromJson(json) {
    return ItemsModel.fromJson(json);
  }
}

class Item {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  Item({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  Item copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) =>
      Item(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
      );

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
