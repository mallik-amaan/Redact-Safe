import 'package:flutter/material.dart';
import 'package:redact_safe/features/home/presentation/screens/home_screen.dart';

// ignore: must_be_immutable
class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});
  final List<Widget> screens = const [
    Center(child: HomeScreen()),
    Center(child: Text("Search Screen")),
    Center(child: Text("Profile Screen")),
  ];
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Files'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Activity'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (value) {
          _currentIndex = value;
        },
      ),
    );
  }
}
