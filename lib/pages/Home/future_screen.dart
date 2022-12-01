// import 'package:doa/pages/Home/Doa/Doa.dart';
// import 'package:doa/pages/Home/alarm/alarm.dart';
// import 'package:doa/pages/Home/appBar/alarm_appBar.dart';
// import 'package:doa/pages/Home/appBar/home_appBar.dart';
// import 'package:doa/pages/Home/profile/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:doa/pages/Home/appBar/profile_appBar.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// class FutureScreen extends StatefulWidget {
//   Function setTheme;
//   FutureScreen({Key? key, required this.setTheme}) : super(key: key);

//   @override
//   State<FutureScreen> createState() => _FutureScreen();
// }

// class _FutureScreen extends State<FutureScreen> {
//   int _selectedIndex = 0;

//   final List<AppBar> _appbar = [
//     homeAppbar(),
//     alarmAppbar(),
//     profileAppbar(),
//   ];

//   late List<Widget> _page = <Widget>[
//     DoaPage(setTheme: widget.setTheme),
//     AlarmPage(),
//     ProfilePage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _appbar[_selectedIndex],
//       body: Container(
//         child: _page[_selectedIndex],
//       ),

//       // bottomNavigationBar: BottomNavigationBar(
//       //   currentIndex: _selectedIndex,
//       //   selectedItemColor: Colors.white,
//       //   backgroundColor: Colors.deepPurple.shade800,
//       //   items: const [
//       //     BottomNavigationBarItem(
//       //         label: 'Doa',
//       //         icon: Icon(Icons.book),
//       //         backgroundColor: Colors.white),
//       //     BottomNavigationBarItem(
//       //         label: 'Alarm',
//       //         icon: Icon(Icons.alarm),
//       //         backgroundColor: Colors.white),
//       //     BottomNavigationBarItem(
//       //         label: 'Profile',
//       //         icon: Icon(Icons.person),
//       //         backgroundColor: Colors.white),
//       //   ],
//       // ),
//     );
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
// }

import 'package:doa/pages/Home/Doa/Doa.dart';
import 'package:doa/pages/Home/alarm/alarm.dart';
import 'package:doa/pages/Home/appBar/alarm_appBar.dart';
import 'package:doa/pages/Home/appBar/home_appBar.dart';
import 'package:doa/pages/Home/appBar/profile_appBar.dart';
import 'package:doa/pages/Home/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class FutureScreen extends StatefulWidget {
  Function setTheme;
  FutureScreen({Key? key, required this.setTheme}) : super(key: key);

  @override
  State<FutureScreen> createState() => _FutureScreen();
}

class _FutureScreen extends State<FutureScreen> {
  int _selectedIndex = 0;

  final List<AppBar> _appbar = [
    homeAppbar(),
    alarmAppbar(),
    profileAppbar(),
  ];

  late List<Widget> _page = <Widget>[
    DoaPage(setTheme: widget.setTheme),
    AlarmPage(),
    ProfilePage(setTheme: widget.setTheme),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar[_selectedIndex],
      body: Container(
        child: _page[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.deepPurple.shade800,
        items: const [
          BottomNavigationBarItem(
              label: 'Doa',
              icon: Icon(Icons.book_online_outlined),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              label: 'Alarm',
              icon: Icon(Icons.alarm),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person),
              backgroundColor: Colors.white),
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
