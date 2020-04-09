import 'package:flutter/material.dart';
import 'package:mintcrispr/screens/home_screen.dart';

void main() => runApp(MintCrisprApp());

class MintCrisprApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'House Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff53b589),
        accentColor: Color(0xff53b0b5),
        buttonColor: Color(0xaa83a9d1),
        unselectedWidgetColor: Color(0xFFD0EAE7),
        backgroundColor: Color(0xffefeff4),
      ),
      home: HomeScreen(),
    );
  }
}
