// To parse this JSON data, do
//
//     final vehicle = vehicleFromJson(jsonString);

import 'dart:convert';

List<Vehicle> vehicleFromJson(String str) => List<Vehicle>.from(json.decode(str).map((x) => Vehicle.fromJson(x)));

String vehicleToJson(List<Vehicle> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Vehicle {
    String? id;
    String? name;
    String? driver;
    String? license;

    Vehicle({
        this.id,
        this.name,
        this.driver,
        this.license,
    });

    factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json["id"],
        name: json["name"],
        driver: json["driver"],
        license: json["license"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "driver": driver,
        "license": license,
    };
}
