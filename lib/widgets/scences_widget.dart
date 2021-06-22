import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScencesWidget extends StatelessWidget {
  final String text;
  final Color color;

  ScencesWidget(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
      height: size.height*0.08,
      width: size.width*0.32,
      margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                color,
                color.withOpacity(0.5),
              ]
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/icons/surface1.svg",color: Colors.white,height: 22.0,),
          SizedBox(width: 10.0,),
          Text("$text",style: TextStyle(color: Colors.white,fontSize: 18.0),)
        ],
      ),
    );
  }
}
