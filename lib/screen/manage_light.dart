import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterassignment/model/grid_model.dart';
import 'package:flutterassignment/screen/control_panel.dart';
import 'package:flutterassignment/screen/home_panel.dart';
import 'package:flutterassignment/screen/setting_panel.dart';
import 'package:flutterassignment/widgets/scences_widget.dart';
import 'package:flutterassignment/widgets/title_info.dart';

class ManageLight extends StatefulWidget {
  final GridModel gridModel;

  ManageLight(this.gridModel);

  @override
  _ManageLightState createState() => _ManageLightState();
}

class _ManageLightState extends State<ManageLight>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  double rating = 1;
  AnimationController firstController;
  AnimationController secondController;

  double rotateAngle = 0.0;
  double scale = 0.0;
  double opacity = 0.0;
  double opacity2 = 0.0;
  double itemExtend = 10.0;

  final List<Widget> _widgetOptions = [
    ControlPanel(),
    HomePanel(),
    SettingPanel()
  ];
  Color myColor = Colors.yellow;
  List<Color> colors = [
    Colors.orangeAccent,
    Colors.greenAccent,
    Colors.lightBlue,
    Colors.deepPurple,
    Colors.purpleAccent,
    Colors.yellow
  ];

  @override
  void initState() {
    // TODO: implement initState
//First Animation
    firstController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..forward();
    firstController.addListener(() {
      setState(() {
        rotateAngle = firstController.value;
        opacity = firstController.value;
      });
    });
    // mainContent
    secondController =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..forward();
    secondController.addListener(() {
      setState(() {
        opacity2 = secondController.value;
        itemExtend = secondController.value * 30 + 10;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    firstController.dispose();
    secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Animation<Offset> offsetanimtion =
        Tween<Offset>(begin: Offset(0.0, 0.3), end: Offset(0.0, 0.6)).animate(
            CurvedAnimation(parent: firstController, curve: Curves.linear));
    Animation<Offset> offsetanimtion2 =
        Tween<Offset>(begin: Offset.zero, end: Offset(0.1, 0.0)).animate(
            CurvedAnimation(parent: secondController, curve: Curves.linear));
    Animation<Offset> offsetanimtion3 =
        Tween<Offset>(begin: Offset(-0.5, 0.0), end: Offset(0.0, 0.0)).animate(
            CurvedAnimation(parent: secondController, curve: Curves.linear));
    Animation<double> _animation = CurvedAnimation(
      parent: firstController,
      curve: Curves.easeIn,
    );
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
            label: '',
          ),
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
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Transform.rotate(
                angle: rotateAngle,
                child: Container(
                  height: size.height * 0.3,
                  width: size.width,
                  child: SvgPicture.asset(
                    'assets/icons/Circles.svg',
                    fit: BoxFit.cover,
                    color: Colors.yellow,
                  ),
                ),
              ),
              //Title Info
              FadeTransition(
                opacity: _animation,
                child: SizedBox(
                  width: size.width,
                  height: size.height * 0.38,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TitleInfo(widget.gridModel, myColor, rating, size,
                        secondController, opacity2),
                  ),
                ),
              ),

              // Main Content

              SlideTransition(
                position: offsetanimtion,
                child: Opacity(
                  opacity: opacity,
                  child: SingleChildScrollView(
                    child: Stack(
                      overflow: Overflow.visible,
                      children: [
                        Container(
                          // margin: EdgeInsets.only(top: size.height * 0.4),
                          height: size.height * 0.7,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0))),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text(
                                    "Intensity",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/icons/solution2.svg"),
                                    Expanded(
                                      child: Slider(
                                        value: rating,
                                        activeColor: Colors.orangeAccent,
                                        onChanged: (newRating) {
                                          setState(() {
                                            rating = newRating;
                                          });
                                        },
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/surface2.svg",
                                      color: Colors.orangeAccent,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text(
                                    "Colors",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                ),
                                Container(
                                  height: size.width*0.15,
                                  width: size.width,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      ListView.builder(
                                        itemExtent: itemExtend,

                                        itemBuilder: (context, index) {
                                          return SlideTransition(
                                            position: offsetanimtion2,
                                            child: IconButton(
                                                icon: Icon(
                                                  Icons.circle,
                                                  color: colors[index],
                                                  size:size.width*0.1,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    myColor = colors[index];
                                                  });
                                                }),
                                          );
                                        },
                                        itemCount: colors.length,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                      ),
                                      SizedBox(
                                        width:size.height*0.005,
                                      ),
                                      Icon(
                                        Icons.add,
                                        size: size.width*0.1,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text(
                                    "Scenes",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        ScencesWidget(
                                            "Birthday", Colors.deepOrangeAccent),
                                        ScencesWidget(
                                            "Relax", Colors.lightBlueAccent),
                                      ],
                                    ),
                                    SlideTransition(
                                      position: offsetanimtion3,
                                      child: Opacity(
                                        opacity: opacity2,
                                        child: Column(
                                          children: [
                                            ScencesWidget(
                                                "Party", Colors.purpleAccent),
                                            ScencesWidget(
                                                "Fun", Colors.greenAccent),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: size.height*0.1,
                                // ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            top: -20.0,
                            right: 15.0,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    'assets/icons/awesome-power-off.svg',
                                    height: 30.0,
                                    width: 30.0,
                                  ),
                                ))),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
