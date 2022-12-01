import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

AppBar profileAppbar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.deepPurple,
    bottomOpacity: 0,
    elevation: 0,
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
        ),
      ),
    ],
  );
}
