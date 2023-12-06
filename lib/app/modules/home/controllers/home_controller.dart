import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sega/app/data/model/vehicle.dart';
import '../../../data/db_provider.dart';

class HomeController extends GetxController {
  final isLoading = true.obs;
  final api = Get.put(DbProvider());
  List<Vehicle> vehicle = <Vehicle>[];
  RxList<Vehicle> searchedVehicles = <Vehicle>[].obs;
  TextEditingController search = TextEditingController();
  late Timer timer;
  @override
  void onInit() {
    fetchVehiclees();
    Timer.periodic(const Duration(seconds: 30), (timer) {
      this.timer = timer;
      fetchVehiclees();
    });
    super.onInit();
  }

  fetchVehiclees() {
    api.fetch({
      "table": "Vehiclev",
    }).then((res) {
      isLoading.value = res.body['res'] == null ? false : true;
      if (res.statusCode! >= 200 &&
          res.statusCode! < 300 &&
          res.body['res'] != null) {
        isLoading.value = false;
        vehicle = vehicleFromJson(json.encode(res.body['res']));
        searchedVehicles.value = vehicle;
      } else {
        print('connection problems');
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    search.dispose();
    super.onClose();
  }

  onchange(str) {
    if (str.length >= 3) {
      searchedVehicles.value = vehicle.map<Vehicle>((vic) {
        if (vic.name!.contains(str)) {
          return vic;
        }
        return Vehicle();
      }).toList();
    } else {
      searchedVehicles.value = vehicle;
    }
  }
}
