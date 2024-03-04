import 'package:flutter/material.dart';
import 'package:tiktok_clone/screens/vidoes/widget/video_post.dart';

class VideoTimeLineScreen extends StatefulWidget {
  const VideoTimeLineScreen({super.key});

  @override
  State<VideoTimeLineScreen> createState() => _VideoTimeLineScreenState();
}

class _VideoTimeLineScreenState extends State<VideoTimeLineScreen> {
  int _itemCount = 4;

  final PageController _pageController = PageController();

  final Duration _scrolleDuration = const Duration(milliseconds: 250);
  final Curve _scrollCurve = Curves.linear;

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: _scrolleDuration,
      curve: _scrollCurve,
    );

    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
    }
    setState(() {});
  }

  void _onVideoFinished() {
    return;
    _pageController.nextPage(
      duration: _scrolleDuration,
      curve: _scrollCurve,
    );
  }

  Future<void> _onRefresh() {
    return Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      displacement: 50,
      edgeOffset: 20,
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _itemCount,
        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) => VideoPost(
          onVideoFinished: _onVideoFinished,
          index: index,
        ),
      ),
    );
  }
}
