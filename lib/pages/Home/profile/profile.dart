import 'package:doa/pages/Login/LoginPage.dart';
import 'package:doa/theme/theme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  Function setTheme;
  ProfilePage({Key? key, required this.setTheme}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double coverHeight = 280;
  double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
              margin: EdgeInsets.only(
                bottom: 80,
              ),
              child: buildTop()),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        coverImage(),
        Positioned(
          top: top,
          child: profileImage(),
        ),
      ],
    );
  }

  Widget buildContent() => Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            'Rasyiqal Fikri',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Mahasiswa',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 120,
          ),
          TextButton(
            child: Text(
              'Logout',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Color.fromRGBO(49, 39, 79, 1),
              padding: EdgeInsets.symmetric(
                horizontal: 24,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(setTheme: widget.setTheme),
                ),
              );
            },
          ),
        ],
      );

  Widget coverImage() => Container(
        color: Colors.grey,
        child: Image(
          image: AssetImage('assets/bg_image.jpg'),
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget profileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: AssetImage('assets/profile.jpg'),
      );
}
