import 'package:flutter/material.dart';
import 'package:flutterassignment/screen/animation_page.dart';

class HomePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white70,
      child: Center(
        child: TextButton(
          child: Text("Home Panel", style: TextStyle(fontSize: 25.0)),
          onPressed: () {
            // Navigator.of(context).push(_createRoute());
          },
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => AnimationPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset.zero;
        var end = Offset.zero;
        // var tween = Tween(begin: begin, end: end);
        var curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end);
        var curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position:tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}
