import 'package:flutter/material.dart';

class NewsRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final String author;

  const NewsRow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: ListTile(
          contentPadding: const EdgeInsets.all(8),
          title: Text(
            title,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            subtitle,
            maxLines: 3,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
            textAlign: TextAlign.start,
          ),
          trailing: Text(
            author,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ),
    );
  }
}
