import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Color(0xFF3451A0),
        middle: Text(
          "Profile",
          style: TextStyle(fontSize: 22.0, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height - CupertinoNavigationBar().preferredSize.height,
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Color(0xFF3451A0).withOpacity(0.5),
                    child: CircleAvatar(
                      radius: 65,
                      backgroundImage: AssetImage("assets/icons/ashu.png"),
                    ),
                  ),
                  Text(
                    "Ashutosh Kumar",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Divider(
                height: 20.0,
                thickness: 2.0,
              ),
              Text(
                "Role",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Flutter and IOS developer",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.teal),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Education",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Babu Banarasi das National Institute of technology and Management,Lucknow (2020)",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
              ),SizedBox(
                height: 10.0,
              ),
              Text(
                "Skills",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Flutter, UI/UX Design, Firebase, Google Map, Api Integration etc",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                ),
              ),SizedBox(
                height: 10.0,
              ),
              Text(
                "Project",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Law Trend App (Android and IOS)",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
