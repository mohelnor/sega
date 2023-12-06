// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    String? id;
    String? name;
    String? phone;
    String? password;
    String? address;
    String? permit;
    String? location;
    DateTime? created;

    User({
        this.id,
        this.name,
        this.phone,
        this.password,
        this.address,
        this.permit,
        this.location,
        this.created,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        password: json["password"],
        address: json["address"],
        permit: json["permit"],
        location: json["location"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "password": password,
        "address": address,
        "permit": permit,
        "location": location,
        "created": created?.toIso8601String(),
    };
}
