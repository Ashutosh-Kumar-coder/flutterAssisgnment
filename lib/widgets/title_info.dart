import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterassignment/model/grid_model.dart';

class TitleInfo extends StatelessWidget {
  final GridModel gridModel;
  final Color myColor;
  final double rating;

  TitleInfo(this.gridModel, this.myColor, this.rating);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 175.0,
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: ()=>Navigator.of(context).pop(),
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
                              "${gridModel.title}",
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "${gridModel.quantity}",
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orangeAccent),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
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
                        color: myColor.withOpacity(rating),
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
            )
          ],
        ),
    
        Container(
          height: 60,
          width: double.infinity,
          child: ListView(

            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
                       children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
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
              ),ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  padding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                ),
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/furniture-and-household.svg",
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
                  padding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
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
              ),ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  padding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
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
      ],
    );
  }
}
