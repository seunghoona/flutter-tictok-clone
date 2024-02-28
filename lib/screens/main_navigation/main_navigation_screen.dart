import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screen[_selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          destinations: const [
            NavigationDestination(
              icon: FaIcon(FontAwesomeIcons.house),
              label: "Home",
            ),
            NavigationDestination(
              icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
              label: "Search",
            )
          ],
          onDestinationSelected: onTap,
        ));
  }
}
