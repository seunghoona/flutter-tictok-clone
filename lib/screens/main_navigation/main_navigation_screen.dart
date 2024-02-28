import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/screens/main_navigation/stf_screen.dart';
import 'package:tiktok_clone/screens/main_navigation/widget/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screen = [
    StfScreen(
      key: GlobalKey(),
    ),
    StfScreen(
      key: GlobalKey(),
    ),
    Container(),
    StfScreen(
      key: GlobalKey(),
    ),
    StfScreen(
      key: GlobalKey(),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_selectedIndex],
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
            Container(),
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
