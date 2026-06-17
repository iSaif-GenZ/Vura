import 'package:flutter/material.dart';

class MusicTitle extends StatelessWidget {
  final String soundName;
  final String artistsName;

  const MusicTitle({
    super.key,
    required this.soundName,
    required this.artistsName,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          soundName.trim(),
          maxLines: 1,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            height: 1.0,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          artistsName.trim(),
          maxLines: 1,
          style: TextStyle(
            color: Colors.grey[500],
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 1.0,
          ),
        ),
      ],
    );
  }
}