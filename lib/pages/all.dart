import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:my_app/components/CustomCard.dart';
import 'package:flutter/services.dart';

class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  List<String> soundPaths = [];
  
  final Map<String, String> artistsName = {
    'Clair_de_Lune': 'Claude Debussy',
    'Comptine_d\'un_autre_été': 'Yann Tiersen',
    'Experience': 'Ludovico Einaudi',
    'Gymnopédie_no.1': 'Erik Satie',
    'Interstellar_Main_Theme': 'Hans Zimmer',
    'Merry_Go_Round_Of_Life': 'Joe Hisaishi',
    'Nuvole_Bianche': 'Ludovico Einaudi',
    'Requiem_For_A_Dream': 'Clint Mansell',
    'River_flows_in_you': 'Yiruma',
    'Time': 'Hans Zimmer',
    'As_It_Was': 'Harry Styles',
    'Birds_of_a_Feather': 'Billie Eilish',
    'Blinding_Lights': 'The Weeknd',
    'Die_with_a_smile': 'Lady Gaga & Bruno Mars',
    'One_Dance': 'Drake',
    'Shape_Of_You': 'Ed Sheeran',
    'Someone_You_Loved': 'Lewis Capaldi',
    'Starboy': 'The Weeknd',
    'Sunflower': 'Post Malone & Swae Lee',
    'Sweater_Weather': 'The Neighbourhood',
  };

  bool isLoading = true;

  Future<List<String>> getSoundsPaths() async {
    final AssetManifest manifest = await AssetManifest.loadFromAssetBundle(
      rootBundle,
    );
    final List<String> allAsset = manifest.listAssets();
    final List<String> paths = allAsset
        .where(
          (String key) =>
              key.startsWith('sounds/music/') ||
              key.startsWith('sounds/songs/'),
        )
        .toList();
    return paths;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final values = await getSoundsPaths();
      values.shuffle();
      setState(() {
        soundPaths = values;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        soundPaths = [];
        isLoading = false;
      });
      debugPrint("error $e");
    }
  }

  String getImagePath(String soundFilePath) {
    String fileName = soundFilePath.split('/').last;
    String soundName = fileName.replaceAll(RegExp(r'\.(mp3)$'), '');
    return 'images/$soundName.jpg';
  }

  String getDisplayName(String soundFilePath) {
    String fileName = soundFilePath.split('/').last;
    String soundName = fileName.replaceAll(RegExp(r'\.(mp3)$'), '');
    return soundName.replaceAll('_', ' ');
  }

  String getArtistName(String soundFileName) {
    String fileName = soundFileName.split('/').last;
    String soundName = fileName.replaceAll(RegExp(r'\.(mp3)$'), '');
    return artistsName[soundName] ?? 'Unknown Artist';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      padding: EdgeInsets.all(8),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.6,
        ),
        itemCount: soundPaths.length,
        itemBuilder: (context, index) {
          String fullName = soundPaths[index];
          return CustomCard(
            soundName: getDisplayName(fullName),
            soundPath: fullName,
            imagePath: getImagePath(fullName),
            artistsName: getArtistName(fullName),
          );
        },
      ),
    );
  }
}
