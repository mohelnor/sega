import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/txtfields.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('الرئيسية'.tr,
              style: const TextStyle(
                color: Colors.greenAccent,
                fontWeight: FontWeight.bold,
              )),
          actions: [
            PopupMenuButton(
                surfaceTintColor: Colors.white,
                itemBuilder: (context) {
                  return [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.exit_to_app_sharp,
                            color: Colors.redAccent,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('خروج'),
                        ],
                      ),
                    ),
                  ];
                },
                onSelected: (value) {
                  if (value == 0) {
                    GetStorage().erase();
                    Get.offAllNamed(Routes.SIGNIN);
                  }
                }),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                    strokeWidth: 1,
                  ))
                : controller.vehicle.isEmpty
                    ? const Center(
                        child: Text('لا توجد مركبات'),
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TxtField(
                              hintText: 'بحث مركبة',
                              controller: controller.search,
                              onChanged: controller.onchange,
                            ),
                          ),
                          Expanded(
                            child: controller.searchedVehicles.isEmpty ||
                                    controller.searchedVehicles[0].id == null
                                ? const Center(
                                    child: Text('لا توجد مركبات'),
                                  )
                                : GridView.builder(
                                    itemCount:
                                        controller.searchedVehicles.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                    itemBuilder: (__, index) {
                                      final vec =
                                          controller.searchedVehicles[index];
                                      return GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.TRACE,
                                              arguments: vec);
                                        },
                                        child: Card(
                                          // color: Colors.red,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.fire_truck,
                                                size: 50,
                                                color: Colors.greenAccent,
                                              ),
                                              Text(
                                                '${vec.name}',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                          ),
                        ],
                      ),
          ),
        ));
  }
}
