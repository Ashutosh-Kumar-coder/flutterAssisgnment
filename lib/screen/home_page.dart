import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterassignment/screen/control_panel.dart';
import 'package:flutterassignment/screen/home_panel.dart';
import 'package:flutterassignment/screen/setting_panel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    ControlPanel(),
    HomePanel(),
    SettingPanel()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3451A0),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/bulb.svg"), label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/feather-home.svg"),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/feather-settings.svg"),
              label: '',),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
