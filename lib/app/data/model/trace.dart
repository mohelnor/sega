// To parse this JSON data, do
//
//     final trace = traceFromJson(jsonString);

import 'dart:convert';

List<Trace> traceFromJson(String str) =>
    List<Trace>.from(json.decode(str).map((x) => Trace.fromJson(x)));

String traceToJson(List<Trace> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Trace {
  String? id;
  String? vehicle;
  String? curLoc;
  String? gps;
  String? user;
  String? state;
  String? created;

  Trace({
    this.id,
    this.vehicle,
    this.curLoc,
    this.gps,
    this.user,
    this.state,
    this.created,
  });

  factory Trace.fromJson(Map<String, dynamic> json) => Trace(
        id: json["id"],
        vehicle: json["vehicle"],
        curLoc: json["cur_loc"],
        gps: json["gps"],
        user: json["user"],
        state: json["state"],
        created: json["created"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vehicle": vehicle,
        "cur_loc": curLoc,
        "gps": gps,
        "user": user,
        "state": state,
        "created": created,
      };
}
