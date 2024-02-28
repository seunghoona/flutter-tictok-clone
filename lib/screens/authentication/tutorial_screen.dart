import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

enum Direction { left, right }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails dragUpdateDetails) {
    if (dragUpdateDetails.delta.dx > 0) {
      setState(() {
        _direction = Direction.right;
      });
    } else {
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails endDetails) {
    if (_direction == Direction.right) {
      setState(() {
        _showingPage = Page.first;
      });
    } else {
      setState(() {
        _showingPage = Page.second;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size14),
            child: AnimatedCrossFade(
                duration: const Duration(milliseconds: 300),
                firstChild: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v40,
                    Text(
                      "Watching Videos",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.size28,
                      ),
                    ),
                    Gaps.v10,
                    Text(
                      "Videos are personalized for you based on what you watch, like, and share.",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    )
                  ],
                ),
                secondChild: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v40,
                    Text(
                      "sendPage Videos",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.size28,
                      ),
                    ),
                    Gaps.v10,
                    Text(
                      "Videos are personalized for you based on what you watch, like, and share.",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    )
                  ],
                ),
                crossFadeState: _showingPage == Page.first
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: AnimatedOpacity(
            opacity: _showingPage == Page.second ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: CupertinoButton(
              onPressed: () => {},
              color: Theme.of(context).primaryColor,
              child: const Text("Enter APP"),
            ),
          ),
        ),
      ),
    );
  }
}
