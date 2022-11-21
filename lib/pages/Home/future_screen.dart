import 'package:doa/pages/Home/Doa/Doa.dart';
import 'package:doa/pages/Home/alarm/alarm.dart';
import 'package:doa/pages/Home/appBar/alarm_appBar.dart';
import 'package:doa/pages/Home/appBar/home_appBar.dart';
import 'package:doa/pages/Home/home/home_model.dart';
import 'package:flutter/material.dart';
import 'package:doa/theme/theme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class FutureScreen extends StatefulWidget {
  const FutureScreen({super.key});

  @override
  State<FutureScreen> createState() => _FutureScreen();
}

class _FutureScreen extends State<FutureScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _page = <Widget>[
    DoaPage(),
    AlarmPage(),
  ];

  final List<AppBar> _appbar = [
    homeAppbar(),
    alarmAppbar(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar[_selectedIndex],
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
