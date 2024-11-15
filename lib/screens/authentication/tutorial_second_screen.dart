import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class TutorialSecondScreen extends StatelessWidget {
  const TutorialSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
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
    );
  }
}
