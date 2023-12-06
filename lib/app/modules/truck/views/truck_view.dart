import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/truck_controller.dart';

class TruckView extends GetView<TruckController> {
  const TruckView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TruckView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TruckView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
