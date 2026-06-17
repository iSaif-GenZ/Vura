import 'package:flutter/material.dart';
import 'package:my_app/pages/all.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:my_app/pages/music.dart';
import 'package:my_app/pages/songs.dart';

void main() {
  AudioCache.instance = AudioCache(prefix: '');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.dark(),
      home: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              dividerColor: Colors.transparent,
              padding: EdgeInsets.only(left: 32, right: 32, top: 24),
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              tabs: [
                Tab(child: Text("songs")),
                Tab(child: Text("all")),
                Tab(child: Text("music")),
              ],
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: const TabBarView(
              children: [
                Songs(),
                All(),
                Music(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

