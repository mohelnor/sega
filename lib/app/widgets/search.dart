
import 'package:flutter/material.dart';

class MySearch extends StatelessWidget {
  const MySearch({
    Key? key,
    required this.searchController,
    this.onChanged,
    this.onPressed,
  }) : super(key: key);

  final TextEditingController? searchController;
  final void Function(String)? onChanged;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.search),
          title: TextField(
            controller: searchController,
            decoration:
                const InputDecoration(hintText: 'Search', border: InputBorder.none),
            onChanged: onChanged,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
