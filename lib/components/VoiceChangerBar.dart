import 'package:flutter/material.dart';

class VoiceChangerBar extends StatefulWidget {
  final Duration currentPos;
  final Duration totalDuration;
  final ValueChanged<Duration> onSeekEnd;
  VoiceChangerBar({
    super.key,
    required this.currentPos,
    required this.totalDuration,
    required this.onSeekEnd,
  });

  @override
  State<VoiceChangerBar> createState() => _VoiceChangerBarState();
}

class _VoiceChangerBarState extends State<VoiceChangerBar> {
  double? _localDragValue;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    double max = widget.totalDuration.inMicroseconds.toDouble();
    double value =
        _localDragValue ?? widget.currentPos.inMicroseconds.toDouble();

    if (value > max) value = max;
    if (value < 0) value = 0;

    Duration currentDuration = _localDragValue != null
        ? Duration(microseconds: _localDragValue!.toInt())
        : widget.currentPos;

    String currentText =
        "${currentDuration.inMinutes}:${(currentDuration.inSeconds % 60).toString().padLeft(2, '0')}";

    String totalText =
        "${widget.totalDuration.inMinutes}:${(widget.totalDuration.inSeconds % 60).toString().padLeft(2, '0')}";

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 5.0,
            ),
            child: Slider(
              padding: EdgeInsets.all(0),
              value: value,
              min: 0.0,
              max: max <= 0 ? 1.0 : max,
              activeColor: Colors.white,
              inactiveColor: Colors.grey[800],
              onChanged: (newValue) {
                setState(() {
                  _localDragValue = newValue;
                });
              },
              onChangeEnd: (newValue) {
                widget.onSeekEnd(Duration(microseconds: newValue.toInt()));
                setState(() {
                  _localDragValue = null;
                });
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                currentText,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                totalText,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
