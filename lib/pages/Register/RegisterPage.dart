import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:dio/dio.dart';
import 'package:doa/pages/Home/future_screen.dart';
import 'package:flutter/material.dart';
import 'package:doa/theme/theme.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  Function setTheme;
  final String? user;
  RegisterPage({Key? key, required this.setTheme, required this.user})
      : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isHidden = true;
  bool isLoading = false;
  final usernameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              margin: EdgeInsets.all(
                24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 32,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  UsernameTextField(),
                  SizedBox(
                    height: 24,
                  ),
                  emailTextField(),
                  SizedBox(
                    height: 24,
                  ),
                  PasswordTextField(),
                  SizedBox(
                    height: 80,
                  ),
                  RegisterButton(context),
                  LoginrButton(),
                ],
              ),
            ),
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
          icon: Icon(Icons.person, color: Colors.deepPurple),
          hintText: "Isi nama mu",
          labelText: "Nama",
        ),
      ),
    );
  }

  Container emailTextField() {
    return Container(
      child: TextFormField(
        controller: emailController,
        validator: (value) =>
            EmailValidator.validate(value!) ? null : "Masukka email yang valid",
        maxLines: 1,
        decoration: InputDecoration(
          icon: Icon(Icons.key, color: Colors.deepPurple),
          hintText: "isi email anda",
          labelText: "Email",
        ),
      ),
    );
  }

  Container PasswordTextField() {
    return Container(
      child: TextFormField(
        controller: passwordController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "silahkan isi password lebih dulu";
          }
          return null;
        },
        maxLines: 1,
        obscureText: _isHidden,
        decoration: InputDecoration(
          suffix: InkWell(
            onTap: _togglePasswordView,
            child: Icon(
              _isHidden ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          icon: Icon(
            Icons.key,
            color: Colors.deepPurple,
          ),
          hintText: "Isi Password",
          labelText: "Password",
        ),
      ),
    );
  }

  Container RegisterButton(context) {
    return Container(
      child: Container(
        width: double.infinity,
        height: 52,
        child: TextButton(
          child: isLoading
              ? CircularProgressIndicator(
                  color: kWhiteColor,
                  backgroundColor: kGreyColor,
                )
              : Text(
                  'Register',
                  style: whiteTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: semiBold,
                  ),
                ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
          ),
          onPressed: () {
            setState(() {
              isLoading = false;
            });
            Future.delayed(Duration(seconds: 2),
            (() {
              setState(
              () {
                isLoading = true;
                try {
                  if (usernameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    print("proses");
                    register(usernameController.text, emailController.text,
                        passwordController.text, context);
                  } else {
                    print('fail');
                    final snackBar = SnackBar(
                      backgroundColor: Color.fromARGB(255, 255, 0, 0),
                      content: Text(
                        'Mohon lengkapi data',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } catch (e) {
                  print(e);
                }
              },
            );
            }));
          },
        ),
      ),
    );
  }

  void register(String nama, email, password, BuildContext context) async {
    try {
      var response = await Dio().post('http://192.168.43.14:3000/user',
          data: {"username": nama, "email": email, "password": password});
      if (response.statusCode == 201) {
        print("akun berhasil dibuat");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                FutureScreen(setTheme: widget.setTheme, user: ""),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Container LoginrButton() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sudah mempunyai akun ? Silahkan',
            style: TextStyle(
              fontSize: 12,
              fontWeight: regular,
            ),
          ),
          TextButton(
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 14,
                fontWeight: semiBold,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
