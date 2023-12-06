// To parse this JSON data, do
//
//     final locations = locationsFromJson(jsonString);

import 'dart:convert';

List<Locations> locationsFromJson(String str) => List<Locations>.from(json.decode(str).map((x) => Locations.fromJson(x)));

String locationsToJson(List<Locations> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Locations {
    String? id;
    String? name;
    String? extra;

    Locations({
        this.id,
        this.name,
        this.extra,
    });

    factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        id: json["id"],
        name: json["name"],
        extra: json["extra"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "extra": extra,
    };
}
