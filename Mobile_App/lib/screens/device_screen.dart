import 'package:flutter/material.dart';
import 'package:mintcrispr/models/Device.dart';

class DeviceScreen extends StatefulWidget {
  final Device _device;

  const DeviceScreen({Device device}) : this._device = device;

  @override
  State<StatefulWidget> createState() => DeviceScreenState();
}

class DeviceScreenState extends State<DeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget._device.name}'),
      ),
    );
  }
}
