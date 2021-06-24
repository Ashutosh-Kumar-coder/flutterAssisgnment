import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterassignment/model/grid_model.dart';

class TitleInfo extends StatefulWidget {
  final GridModel gridModel;
  final Color myColor;
  final double rating;
  final Size size;
  final secondController;
  final opacity;

  TitleInfo(this.gridModel, this.myColor, this.rating, this.size,
      this.secondController, this.opacity);

  @override
  _TitleInfoState createState() => _TitleInfoState();
}

class _TitleInfoState extends State<TitleInfo>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Animation<Offset> offsetanimtion =
        Tween<Offset>(begin: Offset(0.0, -0.2), end: Offset(0.0, 0.1)).animate(
            CurvedAnimation(
                parent: widget.secondController, curve: Curves.linear));
    Animation<Offset> offsetanimtion2 =
        Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(
            CurvedAnimation(
                parent: widget.secondController, curve: Curves.decelerate));
    Animation<Offset> offsetanimtion3 =
        Tween<Offset>(begin: Offset(0.0, -3.0), end: Offset(0.0, 0.1)).animate(
            CurvedAnimation(
                parent: widget.secondController, curve: Curves.decelerate));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                width: widget.size.width * 0.5,
                padding: EdgeInsets.only(left: 10.0),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: SvgPicture.asset(
                          'assets/icons/ionic-md-arrow-round-back.svg',
                          height: 25.0,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.gridModel.title}",
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SlideTransition(
                                position: offsetanimtion3,
                                child: Opacity(
                                  opacity: widget.opacity,
                                  child: Text(
                                    "${widget.gridModel.quantity}",
                                    overflow: TextOverflow.visible,
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orangeAccent),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //Lamp
            SlideTransition(
              position: offsetanimtion,
              child: Opacity(
                opacity: widget.opacity,
                child: Container(
                  width: 150,
                  height: 150,
                  // color: Colors.yellowAccent,
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    overflow: Overflow.clip,
                    children: [
                      Positioned(
                        top: 110,
                        left: 55,
                        child: Container(
                          child: Icon(
                            Icons.circle,
                            size: 40.0,
                            color: widget.myColor.withOpacity(widget.rating),
                          ),
                        ),
                      ),
                      Container(
                        // alignment: Alignment.topCenter,
                        height: 130,
                        width: 130,
                        child: Image.asset(
                          "assets/icons/Group38.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: widget.size.height * 0.01,
        ),
        SlideTransition(
          position: offsetanimtion2,
          child: Opacity(
            opacity: widget.opacity,
            child: Container(
              height: widget.size.height * 0.08,
              width: widget.size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      padding: EdgeInsets.symmetric(
                          horizontal: widget.size.height * 0.02,
                          vertical: widget.size.height * 0.02),
                    ),
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/surface2.svg",
                        color: Colors.black),
                    label: Text(
                      "Main Light",
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      padding: EdgeInsets.symmetric(
                          horizontal: widget.size.height * 0.02,
                          vertical: widget.size.height * 0.02),
                    ),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                        "assets/icons/furniture-and-household.svg",
                        color: Colors.black),
                    label: Text(
                      "Desk Light",
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      padding: EdgeInsets.symmetric(
                          horizontal: widget.size.height * 0.02,
                          vertical: widget.size.height * 0.02),
                    ),
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/bed (1).svg",
                        color: Colors.black),
                    label: Text(
                      "Bed Light",
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      padding: EdgeInsets.symmetric(
                          horizontal: widget.size.height * 0.02,
                          vertical: widget.size.height * 0.02),
                    ),
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/balcony.svg",
                        color: Colors.black),
                    label: Text(
                      "Balcony Light",
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
