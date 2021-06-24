import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterassignment/screen/manage_light.dart';
import 'package:flutterassignment/util/grip_util.dart';

class ControlPanelWidget extends StatelessWidget {
  final Size size;

  ControlPanelWidget(this.size);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(0.0),
      children: [
        Container(
          padding: EdgeInsets.only(left: 20.0, top: 20.0),
          alignment: Alignment.centerLeft,
          child: Text(
            "All Rooms",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        GridView.builder(
          // physics:NeverScrollableScrollPhysics(),
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: size.width*0.09,
              mainAxisSpacing: size.width*0.09,
              // childAspectRatio: 3.2,
              mainAxisExtent: size.width*0.36,
              maxCrossAxisExtent: size.width*0.36),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(_createRoute(index));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: GridTile(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "${GridUtil.gridList[index].imgPath}",
                          height:size.width*0.11,
                          width: size.width*0.11,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          "${GridUtil.gridList[index].title}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold,),
                        ),
                        Text("${GridUtil.gridList[index].quantity}",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange)),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: GridUtil.gridList.length,
        )
      ],
    );
  }

  Route _createRoute(int index) {
    return PageRouteBuilder(
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        animation = CurvedAnimation(parent: animation, curve: Curves.ease);

        return FadeTransition(opacity:animation,child: child);
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return ManageLight(GridUtil.gridList[index]);
      },
    );
  }
}
