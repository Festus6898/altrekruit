import 'package:flutter/material.dart';
import 'package:mera_app/widgets/widgets.dart';
import 'package:mera_app/screens/screens.dart';

class InitialNavigateScreen extends StatefulWidget {
  @override
  _InitialNavigateScreenState createState() => _InitialNavigateScreenState();
}

class _InitialNavigateScreenState extends State<InitialNavigateScreen> {
  final List<Widget> _screens = [
    InitialHomeScreen(),
    LoginScreen(),
    Scaffold(),
    LoginResourceScreen(),
    Scaffold(),
  ];

  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'User SignIN': Icons.perm_identity,
    'Search': Icons.search,
    'Resource SignIN': Icons.people_alt_outlined,
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
