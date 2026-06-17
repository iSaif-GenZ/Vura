import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:my_app/components/CustomImage.dart';
import 'package:my_app/components/MusicTitle.dart';
import 'package:my_app/components/OperatingContainer.dart';
import 'package:my_app/components/VoiceChangerBar.dart';

class MusicPlayerPage extends StatefulWidget {
  final String imagePath;
  final String soundPath;
  final String soundName;
  final String artistsName;

  const MusicPlayerPage({
    super.key,
    required this.imagePath,
    required this.soundPath,
    required this.soundName,
    required this.artistsName,
  });

  @override
  State<MusicPlayerPage> createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  final AudioPlayer player = AudioPlayer();
  Duration _totalDuration = Duration.zero;
  Duration _currentPos = Duration.zero;
  bool _isSeeking = false;
  bool isPlaying = false;

  Future<void> togglePlayPause() async {
    if (isPlaying) {
      await player.pause();
    } else {
      if (_totalDuration > Duration.zero && _currentPos >= _totalDuration) {
        await player.seek(Duration.zero);
      } else {
        if (player.source != null) {
          player.resume();
        } else {
          await player.play(AssetSource(widget.soundPath));
        }
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player.onPlayerStateChanged.listen((PlayerState state) {
      if (!mounted) return;
      setState(() {
        isPlaying = (state == PlayerState.playing);
      });
    });
    player.onDurationChanged.listen((Duration d) {
      if (!mounted) return;
      setState(() {
        _totalDuration = d;
      });
    });

    player.onPositionChanged.listen((Duration p) {
      if (!mounted) return;
      setState(() {
        _currentPos = p;
      });
    });

    player.onPlayerComplete.listen((even) {
      if (!mounted) return;
      setState(() {
        _currentPos = Duration.zero;
        isPlaying = false;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    player.stop();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.black, // تم إضافة خلفية سوداء لتتناسب مع ألوان شريط التقدم
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const SizedBox(height: 8),
          CustomImage(imagePath: widget.imagePath),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.only(left: 24),
            width: double.infinity,
            child: MusicTitle(
              artistsName: widget.artistsName,
              soundName: widget.soundName,
            ),
          ),
          const SizedBox(height: 24),
          VoiceChangerBar(
            onSeekEnd: (newDuration) async {
              setState(() {
                _currentPos = newDuration;
              });
              await player.seek(newDuration);
            },
            currentPos: _currentPos,
            totalDuration: _totalDuration,
          ),
          OperatingContainer(isPlaying: isPlaying, onTap: togglePlayPause),
        ],
      ),
    );
  }
}
