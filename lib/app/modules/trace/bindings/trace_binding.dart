import 'package:get/get.dart';

import '../controllers/trace_controller.dart';

class TraceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TraceController>(
      () => TraceController(),
    );
  }
}
