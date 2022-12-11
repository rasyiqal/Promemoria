import 'package:flutter/material.dart';

AppBar profileAppbar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.deepPurple,
    bottomOpacity: 0,
    elevation: 0,
    actions: [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/list_user');
        },
        icon: Icon(
          Icons.menu,
        ),
      ),
    ],
  );
}
