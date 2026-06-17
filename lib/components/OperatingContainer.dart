import 'package:flutter/material.dart';

class OperatingContainer extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onTap;

  const OperatingContainer({
    super.key,
    required this.isPlaying,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            width: 64,
            height: 64,
            child: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.black,
              size: 48,
            ),
          ),
        ),
      ],
    );
  }
}