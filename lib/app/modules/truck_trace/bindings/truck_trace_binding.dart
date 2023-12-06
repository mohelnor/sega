import 'package:get/get.dart';

import '../controllers/truck_trace_controller.dart';

class TruckTraceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TruckTraceController>(
      () => TruckTraceController(),
    );
  }
}
