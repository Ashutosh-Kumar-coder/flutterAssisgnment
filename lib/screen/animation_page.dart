import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with TickerProviderStateMixin {
  double targetValue = 20.0;
  AnimationController controller;
  AnimationController controller2;
  double opcity = 0.0;
  double itemExtend=10.0;
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
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..forward();
    controller2 =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..forward();
    controller2.addListener(() {
      setState(() {
        opcity = controller2.value;
        itemExtend=controller2.value*50+10;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    controller2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Animation<Offset> offsetanimtion = Tween<Offset>(
            begin: Offset.zero, end: Offset(2.0, 0.0))
        .animate(CurvedAnimation(parent: controller2, curve: Curves.linear));
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: CupertinoNavigationBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RotationTransition(
              turns: controller,
              alignment: Alignment.center,
              child: Container(
                height: 200,
                width: 200,
                color: Colors.pink,
              ),
            ),
            FadeTransition(
              opacity: controller2,
              alwaysIncludeSemantics: true,
              child: Text(
                "Ashutosh Kumar",
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            SlideTransition(
              position: offsetanimtion,
              child: Opacity(
                child: Text("Hello"),
                opacity: opcity,
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.horizontal,
                itemCount: colors.length,
                itemExtent: itemExtend,
                itemBuilder: (context, index) {
                  return SlideTransition(
                    position: offsetanimtion,
                    child: Icon(
                      Icons.circle,
                      color: colors[index],
                      size: 50.0,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
