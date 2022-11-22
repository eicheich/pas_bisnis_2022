import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/shared/Share.dart';
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
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/homeOutline.png'),
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/homeFill.png'),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell),
            activeIcon: Icon(CupertinoIcons.bell_fill),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/clockOutline.png'),
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/clockFill.png'),
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/userOutline.png'),
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/userFill.png'),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedNavbar,
        iconSize: 27,
        selectedItemColor: Color(0xFF1B1B1B),
        unselectedItemColor: Color(0xFF1B1B1B),
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
