import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imagePath;
  const CustomImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          imagePath,
          height: 432,
          /**440 */
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}