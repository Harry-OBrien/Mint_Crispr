import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class AddDeviceScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddDeviceScreenState();
}

class AddDeviceScreenState extends State<AddDeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Device"),
      ),
    );
  }
}
