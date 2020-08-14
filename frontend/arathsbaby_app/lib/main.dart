import 'package:arathsbaby_app/pages/principal_page.dart';
import 'package:arathsbaby_app/pages/home_page.dart';
import 'package:arathsbaby_app/pages/login_page.dart';

import 'package:flutter/material.dart';
import './pages/login_page.dart';

void main() {
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'homePage': (context) => MyHomePage(),
        'main': (context) => HomePage(),
      },
      home: new LoginPage()));
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
      ),
      home: new LoginPage(),
    );
  }
}
