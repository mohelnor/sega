import 'dart:convert';

import 'package:get/get.dart';
import 'package:sega/app/data/model/trace.dart';
import 'package:sega/app/data/model/user.dart';
import 'package:sega/app/data/model/vehicle.dart';

import '../../../data/db_provider.dart';

class TruckTraceController extends GetxController {
  Vehicle vec = Vehicle();
  User user = User();
  final api = Get.put(DbProvider());
  final isLoading = true.obs;
  List<Trace> traces = <Trace>[];
  final index = 0.obs;
  @override
  void onInit() {
    vec = Get.arguments[0];
    user = Get.arguments[1];
    fetchVehicleTrace();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchVehicleTrace() {
    api.fetch({
      "table": "trace",
      "where": " user = ${user.id} AND vehicle = ${vec.id} GROUP BY state",
    }).then((res) {
      isLoading.value = res.body['res'] == null ? false : true;
      print(res.bodyString);
      if (res.statusCode! >= 200 &&
          res.statusCode! < 300 &&
          res.body['res'] != null) {
        isLoading.value = false;
        traces = traceFromJson(json.encode(res.body['res']));
      } else {
        print('connection problems');
      }
    });
  }

  dateDiff(String one, String two) {
    DateTime dt1 = DateTime.parse(one);
    DateTime dt2 = DateTime.parse(two);

    Duration diff = dt1.difference(dt2);
    return {
      "days": diff.inDays,
      "hours": diff.inHours,
      "minutes": diff.inMinutes,
      "seconds": diff.inSeconds
    };
  }
}
