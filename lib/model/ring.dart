import 'dart:convert';

class Ring {
  String imageUrl;
  String metalType;
  String name;
  int price;
  String style;

  Ring({
    required this.imageUrl,
    required this.metalType,
    required this.name,
    required this.price,
    required this.style,
  });

  factory Ring.fromRawJson(String str) => Ring.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ring.fromJson(Map<String, dynamic> json) => Ring(
    imageUrl: json["imageURL"],
    metalType: json["metalType"],
    name: json["name"],
    price: json["price"],
    style: json["style"],
  );

  Map<String, dynamic> toJson() => {
    "imageURL": imageUrl,
    "metalType": metalType,
    "name": name,
    "price": price,
    "style": style,
  };
}
