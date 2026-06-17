import 'package:flutter/material.dart';
import 'package:my_app/pages/musicPlayerPage.dart';

class CustomCard extends StatelessWidget {
  final String soundName;
  final String imagePath;
  final String soundPath;
  final String artistsName;

  const CustomCard({
    super.key,
    required this.soundName,
    required this.soundPath,
    required this.imagePath,
    required this.artistsName,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MusicPlayerPage(
              imagePath: imagePath,
              soundPath: soundPath,
              soundName: soundName,
              artistsName: artistsName,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset(fit: BoxFit.cover, imagePath)),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  soundName,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  artistsName,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.grey[400],
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
