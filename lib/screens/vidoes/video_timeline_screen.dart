import 'package:flutter/material.dart';

class VideoTimeLineScreen extends StatefulWidget {
  const VideoTimeLineScreen({super.key});

  @override
  State<VideoTimeLineScreen> createState() => _VideoTimeLineScreenState();
}

class _VideoTimeLineScreenState extends State<VideoTimeLineScreen> {
  int _itemCount = 4;

  List<Color> colors = [
    Colors.blue,
    Colors.pink,
    Colors.teal,
    Colors.yellow,
  ];

  void _onPageChanged(int page) {
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      colors.addAll([
        Colors.blue,
        Colors.pink,
        Colors.teal,
        Colors.yellow,
      ]);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: colors.length,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) => Container(
              color: colors.elementAt(index),
              child: Center(
                child: Text(
                  "Screen $index",
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ));
  }
}
