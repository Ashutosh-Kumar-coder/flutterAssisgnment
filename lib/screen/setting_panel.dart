import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterassignment/screen/animation_page.dart';

class SettingPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Center(
          child: TextButton(
        child: Text(
          "Setting Panel",
          style: TextStyle(fontSize: 25.0),
        ),
        onPressed: () {
          // Navigator.of(context).push(PageRouteBuilder(
          //   pageBuilder: (context, animation, secondaryAnimation) =>
          //       AnimationPage(),opaque: false
          // ));
        },
      )),
    );
  }
}
