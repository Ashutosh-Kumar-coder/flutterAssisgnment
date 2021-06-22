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
  GlobalKey listKey = GlobalKey();
  double rating = 0;
  AnimationController animationController;
  AnimationController mainContentController;

  double rotateAngle = 0.0;
  double scale = 0.0;
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

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    animationController.forward();
    animationController.addListener(() {
      setState(() {
        rotateAngle = animationController.value;
      });
    });
    // mainContent
    mainContentController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    mainContentController.forward();
    mainContentController.addListener(() {
      setState(() {
        scale = mainContentController.value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
              SizedBox(
                width: size.width,
                height: size.height * 0.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TitleInfo(widget.gridModel, myColor, rating),
                ),
              ),

              // Main Content
              Transform.scale(
                scale: scale,
                child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.35),
                  height: size.height * 0.65,
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
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/solution2.svg"),
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
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        Container(
                          height: 60.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ListView.builder(
                                itemBuilder: (context, index) {
                                  return IconButton(
                                      icon: Icon(
                                        Icons.circle,
                                        color: colors[index],
                                        size: 50.0,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          myColor = colors[index];
                                        });
                                      });
                                },
                                itemCount: colors.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                key: listKey,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Icon(
                                  Icons.add,
                                  size: 40.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "Scenes",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                ScencesWidget(
                                    "Birthday", Colors.deepOrangeAccent),
                                ScencesWidget("Relax", Colors.lightBlueAccent),
                              ],
                            ),
                            Column(
                              children: [
                                ScencesWidget("Party", Colors.purpleAccent),
                                ScencesWidget("Fun", Colors.greenAccent),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
