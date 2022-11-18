import 'package:flutter/material.dart';
import 'package:doa/theme/theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(
            24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Register',
                style: blueTextStyle.copyWith(
                  fontSize: 32,
                  fontWeight: bold,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              UsernameTextField(),
              SizedBox(
                height: 16,
              ),
              EmailTextField(),
              SizedBox(
                height: 16,
              ),
              PasswordTextField(),
              SizedBox(
                height: 16,
              ),
              SecondaryPasswordTextField(),
              SizedBox(
                height: 42,
              ),
              RegisterButton(context),
              LoginrButton(),
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
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: Colors.blue,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              15,
            ),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          hintText: "Isi nama mu",
          labelText: "Nama",
        ),
      ),
    );
  }

  Container PasswordTextField() {
    return Container(
      child: TextFormField(
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
            color: Colors.blue,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              15,
            ),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          hintText: "Isi Password",
          labelText: "Password",
        ),
      ),
    );
  }

  Container SecondaryPasswordTextField() {
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
            color: Colors.blue,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              15,
            ),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          hintText: "Isi Password",
          labelText: "Password",
        ),
      ),
    );
  }

  Container EmailTextField() {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.mail,
            color: Colors.blue,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              15,
            ),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          hintText: "Email",
          labelText: "Email",
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
            backgroundColor: Colors.blue,
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
            style: blackAccentTextStyle.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
            ),
          ),
          TextButton(
            child: Text(
              'Login',
              style: blueTextStyle.copyWith(
                fontSize: 12,
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
