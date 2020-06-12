import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class AddDeviceScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddDeviceScreenState();
}

class AddDeviceScreenState extends State<AddDeviceScreen> {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  @override
  void initState() {
    super.initState();
    // Start scanning
    // flutterBlue.startScan(timeout: Duration(seconds: 4));

    // // Listen to scan results
    // var subscription = flutterBlue.scanResults.listen((results) {
    //   // do something with scan results
    //   // for (ScanResult r in results) {
    //   //   print('${r.device.name} found! rssi: ${r.rssi}');
    //   // }
    // });

    // // Stop scanning
    // flutterBlue.stopScan();

    // print(subscription);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Device"),
      ),
    );
  }
}
