import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class CardImg extends StatelessWidget {
  const CardImg(
      {super.key, required this.txt, required this.imgUrl, this.icon});

  final String txt;
  final String imgUrl;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Image.network(
        imgUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({Key? key, required this.service, this.callback})
      : super(key: key);
  final service;
  final Callback? callback;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Card(
        clipBehavior: Clip.hardEdge,
        // margin: EdgeInsets.only(right: controller.categories.length - 1 == index ? 0 : 8),
        child: Stack(
          children: [
            // Expanded(
            //   child: Image.network(
            //     service.src != null
            //         ? service.src!
            //         : 'https://random.imagecdn.app/500/500',
            //     fit: BoxFit.contain,
            //   ),
            // ),
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                ),
                child: Center(
                  child: Text(service.name!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
