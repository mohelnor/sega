import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      color: Colors.red,
      title: "متابعة المركبات",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green, backgroundColor: Colors.grey[100]),
      ),
    ),
  );
}
