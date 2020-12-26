import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Container(
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
  }
}
