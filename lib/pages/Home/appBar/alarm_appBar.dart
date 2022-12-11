import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

AppBar alarmAppbar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.deepPurple,
    bottomOpacity: 0,
    elevation: 0,
    title: Text(
      'Pengingat Sholat',
      textAlign: TextAlign.center,
    ),
  );
}
