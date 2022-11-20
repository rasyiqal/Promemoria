import 'package:doa/pages/Home/Doa/Doa.dart';
import 'package:doa/pages/Home/alarm/alarm.dart';
import 'package:doa/pages/Home/home/home_model.dart';
import 'package:flutter/material.dart';
import 'package:doa/theme/theme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  static const List<Widget> _page = <Widget>[
    HomeScreen(),
    DoaPage(),
    AlarmPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body: Container(
        child: _page[_selectedIndex],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.deepPurple,
        animationDuration: Duration(milliseconds: 300),
        onTap: _onItemTapped,
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.book,
            color: Colors.white,
          ),
          Icon(
            Icons.alarm,
            color: Colors.white,
            semanticLabel: 'Alarm',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
