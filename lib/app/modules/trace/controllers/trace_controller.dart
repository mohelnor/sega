import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sega/app/data/model/user.dart';
import 'package:sega/app/data/model/vehicle.dart';

import '../../../data/db_provider.dart';

class TraceController extends GetxController {
  late Vehicle vec;
  final box = GetStorage();

  final api = Get.put(DbProvider());
  User user = User();
  final innerState = 'دخول للشحن'.obs;

  List<DropdownMenuItem<String>> innerItems = [
    const DropdownMenuItem<String>(
      alignment: Alignment.center,
      value: 'دخول للشحن',
      child: Text('ادخال مركبة'),
    ),
    const DropdownMenuItem<String>(
      alignment: Alignment.center,
      value: 'الشحن',
      child: Text('شحن المركبة'),
    ),
  ];

  List<DropdownMenuItem<String>> outterItems = [
    const DropdownMenuItem<String>(
      alignment: Alignment.center,
      value: 'الدخول للتفريق',
      child: Text('الدخول للتفريق'),
    ),
    const DropdownMenuItem<String>(
      alignment: Alignment.center,
      value: 'المغادرة',
      child: Text('مغادرة المركبة'),
    ),
  ];
  @override
  void onInit() {
    vec = Get.arguments;
    print(box.read('user').runtimeType);
    if (box.read('user') != null) {
      if (box.read('user') is Map) {
        user = User.fromJson(box.read('user'));
      } else {
        user = box.read('user');
      }
      if (user.permit == 'outter') {
        innerState.value = 'الدخول للتفريق';
      }
    }
    super.onInit();
  }

  @override
  void onReady() {
    print('${user.name} ${user.permit}');
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  saveComment() {
    api.add({
      "table": "trace",
      "data": {
        "vehicle": "${vec.id}",
        "cur_loc": "${user.location}",
        "user": "${user.id}",
        "state": "$innerState",
      }
    }).then((res) {
      print(res.bodyString);
      if (res.statusCode! >= 200 && res.statusCode! < 300 && res.body[0]) {}
    });
  }

  onChanged(str) {
    innerState.value = str;
  }
}
