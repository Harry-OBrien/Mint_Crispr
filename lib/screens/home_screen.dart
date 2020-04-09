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
              fontFamily: "HelveticaNeue-Condensed",
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
        child: Center(
            child: DeviceCarousel(
          devices: mockDeviceData,
        )),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10).add(EdgeInsets.only(top: 5)),
            child: GNav(
                gap: 10,
                activeColor: Theme.of(context).primaryColor,
                color: Colors.grey[400],
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 300),
                tabBackgroundColor: Colors.grey[800],
                textStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1,
                  color: Theme.of(context).primaryColor,
                  fontSize: 15,
                ),
                tabs: [
                  GButton(
                    icon: FontAwesomeIcons.tachometerAlt,
                    text: 'Devices',
                    backgroundColor:
                        Theme.of(context).primaryColor.withAlpha(35),
                  ),
                  GButton(
                    icon: FontAwesomeIcons.folderOpen,
                    text: 'Files',
                    backgroundColor:
                        Theme.of(context).primaryColor.withAlpha(35),
                  ),
                  GButton(
                    icon: FontAwesomeIcons.cogs,
                    text: 'Settings',
                    backgroundColor:
                        Theme.of(context).primaryColor.withAlpha(35),
                  ),
                ],
                selectedIndex: 0,
                onTabChange: (index) {
                  setState(() {
                    // pageController.jumpToPage(index);
                  });
                }),
          ),
        ),
      ),
    );
  }
}
