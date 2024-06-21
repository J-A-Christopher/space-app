import 'package:flutter/material.dart';

class FavCards extends StatelessWidget {
  final String imagePath;
  final String descText;
  const FavCards({super.key, required this.descText, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          Image.asset('assets/$imagePath'),
          const SizedBox(
            height: 10,
          ),
          Text(descText)
        ],
      ),
    );
  }
}
