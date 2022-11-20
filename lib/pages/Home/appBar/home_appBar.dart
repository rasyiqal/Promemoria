import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

AppBar homeAppbar() {
  return AppBar(
    backgroundColor: Colors.deepPurple,
    title: Text('Home'),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.light_mode),
      ),
    ],
  );
}
