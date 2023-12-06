import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/truck_trace_controller.dart';

class TruckTraceView extends GetView<TruckTraceController> {
  const TruckTraceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تقرير المركبة'),
        centerTitle: true,
      ),
      body: Obx(() => controller.isLoading.value
          ? const CircularProgressIndicator(
              strokeWidth: 1,
            )
          : SingleChildScrollView(
              child: controller.traces.isEmpty
                  ? SizedBox(
                      height: Get.height * 0.85,
                      child: const Center(
                        child: Text(
                          'لا يتوفر سجل تعقب',
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    )
                  : Stepper(
                      currentStep: controller.index.value,
                      controlsBuilder: (context, details) {
                        return Container();
                      },
                      onStepTapped: (int index) {
                        controller.index.value = index;
                      },
                      steps: <Step>[
                        Step(
                          title: Text('${controller.traces[0].state}'),
                          content: Container(
                            alignment: Alignment.topRight,
                            child: Column(
                              children: [
                                Text('${controller.traces[0].created}'),
                                const SizedBox(height: 10),
                                if (controller.traces.length > 1)
                                  Period(
                                      '${controller.dateDiff(controller.traces[1].created!, controller.traces[0].created!)['minutes']}'),
                              ],
                            ),
                          ),
                        ),
                        Step(
                          title: Text('${controller.traces[1].state}'),
                          content: Container(
                            alignment: Alignment.topRight,
                            child: Column(
                              children: [
                                Text('${controller.traces[1].created}'),
                                if (controller.traces.length > 2)
                                  Period(
                                      '${controller.dateDiff(controller.traces[2].created!, controller.traces[1].created!)['minutes']}'),
                              ],
                            ),
                          ),
                        ),
                        if (controller.traces.length > 3)
                          Step(
                            title: Text('${controller.traces[2].state}'),
                            content: Container(
                              alignment: Alignment.topRight,
                              child: Column(
                                children: [
                                  Text('${controller.traces[2].created}'),
                                  if (controller.traces.length > 3)
                                    Period(
                                        '${controller.dateDiff(controller.traces[2].created!, controller.traces[3].created!)['minutes']}'),
                                ],
                              ),
                            ),
                          ),
                        if (controller.traces.length > 3)
                          Step(
                            title: Text('${controller.traces[3].state}'),
                            content: Container(
                              alignment: Alignment.topRight,
                              child: Column(
                                children: [
                                  Text('${controller.traces[3].created}'),
                                  if (controller.traces.length > 4)
                                    Period(
                                        '${controller.dateDiff(controller.traces[3].created!, controller.traces[4].created!)['minutes']}'),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
            )),
    );
  }
}

class Period extends StatelessWidget {
  const Period(
    this.str, {
    super.key,
  });

  final String str;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('الفترة الزمنية'),
        const SizedBox(
          width: 5,
        ),
        Text(style: const TextStyle(fontWeight: FontWeight.bold), str),
        const SizedBox(
          width: 5,
        ),
        const Text('دقيقة'),
      ],
    );
  }
}
