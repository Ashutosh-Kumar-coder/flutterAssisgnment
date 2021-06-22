import 'package:flutter/material.dart';

class HomePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white70,
      child: Center(child: Text("Home Panel",style: TextStyle(fontSize: 25.0),)),
    );
  }
}
