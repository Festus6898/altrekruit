import 'package:flutter/material.dart';
import 'package:mera_app/widgets/responsive.dart';

import 'home_screen.dart';

class NavigateScreen extends StatefulWidget {
  @override
  _NavigateScreenState createState() => _NavigateScreenState();
}

class _NavigateScreenState extends State<NavigateScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Coming Soon': Icons.queue_play_next,
    'Search': Icons.search,
    'Downloads': Icons.file_download,
    'More': Icons.menu,
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.black,
                items: _icons
                    .map((title, icon) => MapEntry(
                        title,
                        BottomNavigationBarItem(
                          icon: Icon(icon, size: 30.0),
                          title: Text(title),
                        )))
                    .values
                    .toList(),
                currentIndex: _currentIndex,
                selectedItemColor: Colors.blueAccent,
                selectedFontSize: 11.0,
                unselectedItemColor: Colors.white,
                unselectedFontSize: 11.0,
                onTap: (index) => setState(() => _currentIndex = index),
              )
            : null,
      ),
    );
  }
}
