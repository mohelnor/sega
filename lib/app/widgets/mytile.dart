import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  const MyTile(
      {Key? key,
      this.title,
      this.onTap,
      required this.icon,
      this.trailing = '',
      required this.color})
      : super(key: key);
  final String? title;
  final IconData icon;
  final String trailing;
  final Color color;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: Container(
          width: 46,
          height: 46,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: color.withAlpha(30)),
          child: Center(
            child: Icon(
              icon,
              color: color,
            ),
          ),
        ),
        title: Text(title!, style: theme.textTheme.subtitle1),
        trailing: SizedBox(
          width: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(trailing,
                  style: theme.textTheme.bodyText1
                      ?.copyWith(color: Colors.grey.shade600)),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ],
          ),
        ),
        onTap: onTap);
  }
}

class MyTileCard extends StatelessWidget {
  const MyTileCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      this.color,
      this.icon,
      this.onTap,
      this.ElevatedButton})
      : super(key: key);

  final String title, subtitle;
  final Color? color;
  final IconData? icon;
  final void Function()? onTap;
  final Widget? ElevatedButton;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.grey[100],
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: color!.withOpacity(0.3),
                minRadius: 30,
                child: Center(
                  child: Icon(Icons.person, size: 32, color: color),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton ?? Container(),
            ],
          ),
        ),
      ),
    );
  }
}
