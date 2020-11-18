// To parse this JSON data, do
//
//     final itemList = itemListFromJson(jsonString);

import 'dart:convert';

class ItemList {
  ItemList({
    this.count,
    this.next,
    this.previous,
    this.items,
  });

  int count;
  String next;
  dynamic previous;
  List<Result> items;

  static ItemList itemListFromJson(String str) => ItemList.fromJson(json.decode(str));

  static String itemListToJson(ItemList data) => json.encode(data.toJson());

  factory ItemList.fromJson(Map<String, dynamic> json) => ItemList(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    items: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.name,
    this.url,
  });

  String name;
  String url;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}
