import 'package:doa/pages/Login/LoginPage.dart';
import 'package:doa/widgets/darktheme.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData themeData = ThemeData.light();

  void setTheme(bool isDarkMode) {
    setState(() {
      themeData = (isDarkMode) ? ThemeData.dark() : ThemeData.light();
      SharedPref.pref?.setBool('isDarkMode', isDarkMode);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    bool isDarkMode = SharedPref.pref?.getBool('isDarkMode') ?? false;
    setTheme(isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reminder App',
      theme: themeData,
      home: LoginPage(setTheme: setTheme),
    );
  }
}
