import 'package:doa/pages/Home/future_screen.dart';
import 'package:flutter/material.dart';
import 'package:doa/theme/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 400,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: -40,
                      height: 400,
                      width: width + 20,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/background.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      height: 400,
                      width: width + 20,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/background-2.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Color.fromRGBO(49, 39, 79, 1),
                        fontWeight: bold,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LoginTextField(),
                          PasswordTextField(),
                          SizedBox(
                            height: 56,
                          ),
                          LoginButton(),
                          RegisterButton(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container LoginTextField() {
    return Container(
      padding: EdgeInsets.only(
        top: 24,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: Colors.deepPurple.shade400,
          ),
        ),
      ),
    );
  }

  Container PasswordTextField() {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          suffix: InkWell(
            onTap: _togglePasswordView,
            child: Icon(
              _isHidden ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          icon: Icon(
            Icons.key,
            color: Colors.deepPurple.shade400,
          ),
        ),
      ),
    );
  }

  Container LoginButton() {
    return Container(
      child: Container(
        width: double.infinity,
        height: 40,
        child: TextButton(
          child: Text(
            'Login',
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
                  builder: (context) =>FutureScreen(),
                ));
          },
        ),
      ),
    );
  }

  Container RegisterButton(context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Belum punya akun ? Silahkan',
            style: blackAccentTextStyle.copyWith(
              fontSize: 16,
              fontWeight: regular,
            ),
          ),
          TextButton(
            child: Text('Register',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 16,
                  fontWeight: bold,
                )),
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
          ),
        ],
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden:
      !_isHidden;
    });
  }
}
