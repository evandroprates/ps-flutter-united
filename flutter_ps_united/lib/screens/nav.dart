import 'package:flutter/material.dart';
import 'package:flutter_ps_united/screens/Home.dart';
import 'package:flutter_ps_united/screens/baseHistorica.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    BaseHistorica()
    // HomeDashboard()
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fiber_new_rounded,
            ),
            title: Text(
              'Tempo Real',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history
            ),
            title: Text(
              'Base Histórica',
            ),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.person,
          //   ),
          //   title: Text(
          //     'Profile',
          //   ),
          // ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}