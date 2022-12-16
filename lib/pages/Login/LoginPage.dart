import 'package:doa/pages/Home/future_screen.dart';
import 'package:doa/pages/Register/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:doa/theme/theme.dart';
import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  Function setTheme;
  LoginPage({Key? key, required this.setTheme}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;
  final usernameController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool isShowPasswordError = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                      style: deepPurpleTextStyle.copyWith(
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
          icon: Icon(Icons.person, color: Colors.deepPurple),
          hintText: "Isi nama mu",
          labelText: "Nama",
        ),
      ),
    );
  }

  Container PasswordTextField() {
    return Container(
      child: TextFormField(
        controller: passwordController,
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

  Container LoginButton() {
    return Container(
      child: Container(
        width: double.infinity,
        height: 40,
        child: TextButton(
          onPressed: () {
            setState(() {
              isLoading = true;
            });
            Future.delayed(
              Duration(seconds: 2),
              () {
                setState(() {
                  isLoading = false;
                });
                login(usernameController.text, passwordController.text);
                // Navigator.pushNamed(context, '/future');
              },
            );
          },
          style: TextButton.styleFrom(
            backgroundColor: Color.fromRGBO(49, 39, 79, 1),
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
          ),
          child: isLoading
              ? CircularProgressIndicator(
                  color: kWhiteColor,
                  backgroundColor: kGreyColor,
                )
              : Text(
                  'Login',
                  style: whiteTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: semiBold,
                  ),
                ),
        ),
      ),
    );
  }

  void login(String usernameController, passwordController) async {
    try {
      // GET data from json
      var response = await Dio().get('http://192.168.43.14:3000/user');
      // inisialisasi panjang data
      var panjang_data = response.data.length;
      if (response.statusCode == 200) {
        for (var i = 0; i <= panjang_data; i++) {
          if (usernameController == response.data[i]['username'] &&
              passwordController == response.data[i]['password']) {
            print("Login success");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    FutureScreen(setTheme: widget.setTheme, user: response.data[i]['username'],),
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
            style: TextStyle(
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
                    builder: (context) => RegisterPage(setTheme: widget.setTheme, user:""),
                  ));
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
