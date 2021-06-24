import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterassignment/screen/profile_screen.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Control",
                style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "Panel",
                style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),

        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(CupertinoPageRoute(builder: (_)=>ProfilePage()));
          },
          child: CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage("assets/icons/ashu.png"),
            ),
          ),
        )
      ],
    );
  }
}
