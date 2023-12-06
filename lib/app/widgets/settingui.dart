
import 'package:flutter/material.dart';

class SettingTiles extends StatelessWidget {
  const SettingTiles({super.key, required this.txt, this.icon, this.onTap});

  final String txt;
  final IconData? icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          title: Text(txt),
          trailing: Icon(icon),
        ),
      ),
    );
  }
}
