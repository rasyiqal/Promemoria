import 'package:doa/pages/Home/Doa/Doa.dart';
import 'package:doa/pages/Home/future_screen.dart';
import 'package:doa/pages/Register/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:doa/theme/theme.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:doa/data/api/user_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  bool isShowPassword = false;
  final usernameController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

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
                          UsernameTextField(),
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

  Container UsernameTextField() {
    return Container(
      padding: EdgeInsets.only(
        top: 24,
      ),
      child: TextFormField(
        controller: usernameController,
        decoration: InputDecoration(
          hintText: 'username',
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
        obscureText: (isShowPassword) ? false : true,
        controller: passwordController,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            icon: Icon(
              Icons.key,
              color: Colors.deepPurple.shade400,
            ),
            hintText: 'password'),
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
            login(usernameController.text, passwordController.text);
          },
        ),
      ),
    );
  }

  void login(String usernameController, passwordController) async {
    try {
      // GET data from json
      var response = await Dio().get('http://localhost:3000/user');
      // inisialisasi panjang data
      var panjang_data = response.data.length;
      if (response.statusCode == 200) {
        // pengecekan dengan perulangan dan percabangan,
        // input akan dicek dari semua data yg sudah ada di json
        for (var i = 0; i <= panjang_data; i++) {
          if (usernameController == response.data[i]['user'] &&
              passwordController == response.data[i]['password']) {
            print("Login success");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FutureScreen(),
              ),
            );
            break;
          }
        }
      } else {
        final snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Login failed',
            style: TextStyle(
              fontFamily: 'Poppins-Regular',
              color: Colors.white,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          'Username atau Password salah',
          style: TextStyle(
            fontFamily: 'Poppins-Regular',
            color: Colors.white,
          ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }

  // void _toggle() {
  //   setState(() {
  //     _obscureText = !_obscureText;
  //   });
  // }

}
