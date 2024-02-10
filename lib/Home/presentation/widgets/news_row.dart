import 'package:flutter/material.dart';

class NewsRow extends StatelessWidget {
  final String title;
  final String subtitle;
  const NewsRow({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:8.0),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: ListTile(

          title: Text(title),
          subtitle: Text(subtitle),

        ),
      ),
    );
  }
}