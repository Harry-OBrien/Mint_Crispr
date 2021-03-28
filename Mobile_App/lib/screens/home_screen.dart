import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mintcrispr/models/Device.dart';
import 'package:mintcrispr/screens/add_device_screen.dart';
import 'package:mintcrispr/widgets/device_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: 'Mint',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w200,
              fontSize: 40,
              letterSpacing: 1.4,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Crispr',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                print("Add button pressed!");
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new AddDeviceScreen(),
                  ),
                );
              },
              icon: Icon(
                FontAwesomeIcons.plus,
                size: 22,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(child: DeviceCarousel(devices: mockDeviceData)),
      ),
      bottomNavigationBar: Container(),
    );
  }
}
