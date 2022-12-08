import 'package:flutter/material.dart';
import 'package:doa/theme/theme.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isHidden = true;
  final usernameController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final passwordConfirm = TextEditingController(text: '');

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
                  PasswordTextField(),
                  SizedBox(
                    height: 24,
                  ),
                  ConfirmPasswordTextField(),
                  SizedBox(
                    height: 42,
                  ),
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
          icon: Icon(Icons.key, color: Colors.deepPurple),
          hintText: "Isi Password",
          labelText: "Password",
        ),
      ),
    );
  }

  Container ConfirmPasswordTextField() {
    return Container(
      child: TextFormField(
        controller: passwordController,
        decoration: InputDecoration(
          suffix: InkWell(
            onTap: _togglePasswordView,
            child: Icon(
              _isHidden ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          icon: Icon(Icons.key, color: Colors.deepPurple),
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
        height: 32,
        child: TextButton(
          child: Text(
            'Register',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: regular,
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
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
