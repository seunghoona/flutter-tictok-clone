import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/screens/main_navigation/widget/nav_tab.dart';
import 'package:tiktok_clone/screens/main_navigation/widget/post_view_button.dart';
import 'package:tiktok_clone/screens/vidoes/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostViedoButtonTap() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Container(),
          fullscreenDialog: true,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // keyboard 가 올라올 때 화면 깨짐 방지
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimeLineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: Container(),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTap(
              icon: FontAwesomeIcons.house,
              selectedIcon: FontAwesomeIcons.house,
              text: "house",
              isSelected: _selectedIndex == 0,
              onTap: () => {
                _onTap(0),
              },
            ),
            NavTap(
              icon: FontAwesomeIcons.compass,
              selectedIcon: FontAwesomeIcons.solidCompass,
              text: "Discover",
              isSelected: _selectedIndex == 1,
              onTap: () => {
                _onTap(1),
              },
            ),
            Gaps.h10,
            GestureDetector(
                onTap: _onPostViedoButtonTap, child: const PostViewButton()),
            Gaps.h10,
            NavTap(
              icon: FontAwesomeIcons.message,
              selectedIcon: FontAwesomeIcons.solidMessage,
              text: "Inbox",
              isSelected: _selectedIndex == 3,
              onTap: () => {
                _onTap(3),
              },
            ),
            NavTap(
              icon: FontAwesomeIcons.user,
              selectedIcon: FontAwesomeIcons.solidUser,
              text: "Profile",
              isSelected: _selectedIndex == 4,
              onTap: () => {
                _onTap(4),
              },
            )
          ],
        ),
      ),
    );
  }
}
