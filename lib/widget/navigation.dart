import 'package:flutter/material.dart';
import '../screens/home.dart';
import '../screens/profile.dart';
import '../screens/about.dart'; // Import halaman about.dart

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Tambahkan AboutPage ke dalam list
    final List<Widget> _pages = [
      const HomePage(),
      ProfilePage(onHomeTap: () => _onTabTapped(0)),
      const AboutPage(), // Halaman baru
    ];

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ), // Item navigasi baru
        ],
      ),
    );
  }
}
