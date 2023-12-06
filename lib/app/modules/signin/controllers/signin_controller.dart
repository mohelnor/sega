import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../data/db_provider.dart';
import '../../../data/model/user.dart';
import '../../../routes/app_pages.dart';

class SigninController extends GetxController {
  final isLoading = true.obs;
  final api = Get.put(DbProvider());
  final box = GetStorage();
  User user = User();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void onInit() {
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

  void login() {
    if (phone.text.isNotEmpty && password.text.isNotEmpty) {
      api.queryData({
        "query":
            "SELECT * FROM users WHERE phone = '${phone.text}' and password = '${password.text}' and permit IN ('inner','outter')",
        "return_result": "true"
      }).then((value) {
        print(value.bodyString);
        if (value.statusCode! >= 200 &&
            value.statusCode! < 300 &&
            value.body['msg'] == 'ok' &&
            value.body['res'][0] != 0) {
          user = User.fromJson(value.body['res'][1][0]);
          if (user.id == null) {
            Get.bottomSheet(Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                height: 130,
                width: 200,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Material(
                  color: Colors.transparent,
                  textStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  child: Column(
                    children: [
                      const Expanded(
                          child: Center(
                        child: Text(
                          'خطأ في الوصول, تأكد من بيانات',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                      ElevatedButton.icon(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.close),
                          label: const Text(
                            'لا',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ));
          } else {
            box.write('user', user);
            print('${user.id}');
            isLoading.value = false;
            Get.offNamed(Routes.HOME);
          }
        } else {
          print('connection problems');
        }
      });
    }
  }
}
