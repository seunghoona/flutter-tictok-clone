import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/screens/main_navigation/widget/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screen = [
    const Center(
      child: Text("Home"),
    ),
    const Center(
      child: Text("Search"),
    )
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTap(
              icon: FontAwesomeIcons.house,
              text: "house",
              isSelected: _selectedIndex == 0,
              onTap: () => {
                _onTap(0),
              },
            ),
            NavTap(
              icon: FontAwesomeIcons.magnifyingGlass,
              text: "Discover",
              isSelected: _selectedIndex == 1,
              onTap: () => {
                _onTap(1),
              },
            ),
            NavTap(
              icon: FontAwesomeIcons.question,
              text: "Inbox",
              isSelected: _selectedIndex == 2,
              onTap: () => {
                _onTap(2),
              },
            ),
            NavTap(
              icon: FontAwesomeIcons.user,
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
