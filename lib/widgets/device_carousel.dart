import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mintcrispr/models/Device.dart';
import 'package:mintcrispr/screens/device_screen.dart';

class DeviceCarousel extends StatelessWidget {
  final List<Device> devices;
  final borderRadius = 20.0;

  const DeviceCarousel({this.devices});

  @override
  Widget build(BuildContext context) {
    // TODO: Refactor empty list view out of the carousel widget
    if (devices.length <= 0) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.73,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "You have no devices at the moment!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24.0,
                    color: Theme.of(context).accentColor),
              ),
            ),
            Text(
              "Add a device with '+' button above.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w200),
            ),
          ],
        ),
      );
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.66,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: devices.length,
        itemBuilder: (BuildContext context, int index) {
          Device device = devices[index];
          return Container(
            margin: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(borderRadius),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 6.0)
                ]),
            child: FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new DeviceScreen(
                      device: device,
                    ),
                  ),
                );
              },
              child: Stack(
                children: <Widget>[
                  // Title of group
                  Positioned(
                    left: 10.0,
                    bottom: 10.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          device.name,
                          style: TextStyle(
                              color: Color(0xFF1A1A1A),
                              fontSize: 34.0,
                              fontWeight: FontWeight.w200,
                              letterSpacing: 1.3),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Icon(
                                FontAwesomeIcons.bluetoothB,
                                size: 13.0,
                                color: Color(0xFF1A1A1A),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text('Connected'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
