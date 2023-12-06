import 'package:flutter/material.dart';

class ImgSrc extends StatelessWidget {
  const ImgSrc({super.key, required this.img, required this.height, required this.width});
  final String? img;
  final double height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center, // use aligment
      child: img == null
          ? Image.asset(
              img!,
              height: height,
              width: width,
              fit: BoxFit.cover,
            )
          : Container(),
    );
  }
}
