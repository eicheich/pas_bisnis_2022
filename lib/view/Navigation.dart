import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/shared/hexConvert.dart';
import 'package:pas_bisnis_2022/view/History.dart';
import 'package:pas_bisnis_2022/view/Home.dart';
import 'package:pas_bisnis_2022/view/Notif.dart';
import 'package:pas_bisnis_2022/view/Profile.dart';
import 'package:pas_bisnis_2022/view/Search.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedNavbar = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Notif(),
    history(),
    Profile(),
  ];

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedNavbar),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/home.png'),
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/home.png'),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                'assets/images/shop.png',
              ),
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/shop.png'),
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/history.png'),
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/history.png'),
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/user.png'),
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/user.png'),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedNavbar,
        iconSize: 24,
        selectedItemColor: Color(0xFF1E5128),
        unselectedItemColor: Color(0xFF2B2D42),
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
            fontFamily: "Lexend", fontWeight: FontWeight.w600, fontSize: 12),
        unselectedLabelStyle: TextStyle(
            fontFamily: "Lexend", fontWeight: FontWeight.w600, fontSize: 12),
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
