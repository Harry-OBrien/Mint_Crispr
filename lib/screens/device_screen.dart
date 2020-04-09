import 'package:flutter/material.dart';

class DeviceScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DeviceScreenState();
}

class DeviceScreenState extends State<DeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Device"),
      ),
    );
  }
}
