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
        accentColor: Color(0xee83a9d1),
        unselectedWidgetColor: Color(0xFFD0EAE7),
      ),
      home: HomeScreen(),
    );
  }
}
