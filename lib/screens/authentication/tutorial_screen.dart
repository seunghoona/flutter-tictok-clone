import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/authentication/tutorial_first_screen%20copy.dart';
import 'package:tiktok_clone/screens/authentication/tutorial_second_screen.dart';
import 'package:tiktok_clone/screens/main_navigation/main_navigation_screen.dart';

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
  Widget? page = const TutorialFirstScreen();
  AnimatedCrossFade? abstr;

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
        page = const TutorialFirstScreen();
      });
    } else {
      setState(() {
        _showingPage = Page.second;
        page = const TutorialSecondScreen();
      });
    }
  }

  void _onNextTap() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const MainNavigationScreen(),
      ),
      (route) => false,
    );
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
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: child,
              ),
              child: page,
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: AnimatedOpacity(
            opacity: _showingPage == Page.second ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: CupertinoButton(
              onPressed: _onNextTap,
              color: Theme.of(context).primaryColor,
              child: const Text("Enter APP"),
            ),
          ),
        ),
      ),
    );
  }
}
