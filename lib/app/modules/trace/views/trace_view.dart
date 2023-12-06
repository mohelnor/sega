import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sega/app/routes/app_pages.dart';
import '../../../widgets/myrow.dart';
import '../controllers/trace_controller.dart';

class TraceView extends GetView<TraceController> {
  const TraceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.vec.name!),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.TRUCK_TRACE, arguments: [controller.vec,controller.user]);
            },
            color: Colors.green,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: SizedBox(
          height: Get.height * 0.95,
          child: Card(
            color: Get.isDarkMode ? Colors.transparent : Colors.grey[100],
            margin: const EdgeInsets.all(15.0),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      MyRow(txt: 'اسم المركبة', txt2: '${controller.vec.name}'),
                      MyRow(txt: 'السائق', txt2: '${controller.vec.driver}'),
                      MyRow(txt: 'الترخيص', txt2: '${controller.vec.license}'),
                      const SizedBox(
                        height: 5,
                      ),
                      controller.user.permit == 'inner'
                          ? Column(
                              children: [
                                Obx(
                                  () => Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          border: Border.all(
                                              color: Colors.black12)),
                                      child: DropdownButton(
                                        focusColor: Colors.grey[100],
                                        dropdownColor: Colors.grey[100],
                                        hint: const Text('اختيار المرحلة'),
                                        items: controller.innerItems,
                                        value: controller.innerState.value,
                                        onChanged: controller.onChanged,
                                        isExpanded: true,
                                        alignment: Alignment.center,
                                        underline: Container(),
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    controller.saveComment();
                                  },
                                  style: ButtonStyle(
                                      foregroundColor:
                                          const MaterialStatePropertyAll(
                                              Colors.black),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.greenAccent,
                                      )),
                                  child: SizedBox(
                                      width: Get.width,
                                      height: 40,
                                      child:
                                          const Center(child: Text('موافق'))),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Obx(() => Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          border: Border.all(
                                              color: Colors.black12)),
                                      child: DropdownButton(
                                        hint: const Text('اختيار المرحلة'),
                                        items: controller.outterItems,
                                        value: controller.innerState.value,
                                        onChanged: controller.onChanged,
                                        isExpanded: true,
                                        alignment: Alignment.center,
                                        underline: Container(),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          const MaterialStatePropertyAll(
                                              Colors.black),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.redAccent,
                                      )),
                                  onPressed: () {
                                    controller.saveComment();
                                  },
                                  child: SizedBox(
                                      width: Get.width,
                                      height: 40,
                                      child:
                                          const Center(child: Text('موافق'))),
                                ),
                              ],
                            ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
