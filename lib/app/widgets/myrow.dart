import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyRow extends StatelessWidget {
  final String txt, txt2;

  final int maxLines;

  const MyRow({
    super.key,
    required this.txt,
    required this.txt2,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.black12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            txt,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: Text(txt2, maxLines: maxLines, softWrap: true)),
        ],
      ),
    );
  }
}

class MyColomn extends StatelessWidget {
  final String txt, txt2;
  final int maxLines;

  const MyColomn({
    super.key,
    required this.txt,
    required this.txt2,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: Get.width,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            txt,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: Text(txt2, maxLines: maxLines, softWrap: true)),
        ],
      ),
    );
  }
}
