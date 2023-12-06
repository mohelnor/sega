import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/model/user.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final box = GetStorage();
  User user = User();
  @override
  void onInit() {
    if (box.read('user') != null) {
      user = User.fromJson(box.read('user'));
    }
    super.onInit();
  }

  @override
  void onReady() {
    checkAuth();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkAuth() {
    if (user.id != null) {
      Timer(const Duration(seconds: 3), () {
        Get.offNamed(Routes.HOME);
      });
    } else {
      Get.offNamed(Routes.SIGNIN);
    }
  }
}
