import 'package:meta/meta.dart';

class Device {
  final int id;
  final String bluetoothId;
  final String name;

  Device({
    @required this.id,
    @required this.bluetoothId,
    @required this.name,
  });

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        id: json['id'],
        bluetoothId: json['bluetooth_id'],
        name: json['name'],
      );
}

final List<Device> mockDeviceData = [
  Device(
    id: 0,
    bluetoothId: "b6589fc6ab0dc82cf12099d1c2d40ab994e8410c",
    name: "Device 0",
  ),
  Device(
    id: 1,
    bluetoothId: "356a192b7913b04c54574d18c28d46e6395428ab",
    name: "Device 1",
  ),
  Device(
    id: 2,
    bluetoothId: "da4b9237bacccdf19c0760cab7aec4a8359010b0",
    name: "Device 2",
  ),
];
