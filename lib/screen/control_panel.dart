import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterassignment/widgets/app_bar_widget.dart';
import 'package:flutterassignment/widgets/control_panel_widget.dart';

class ControlPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SizedBox(
              width: size.width * 0.9,
              height: size.height * 0.2,
              child: Stack(
                children: [
                  Container(
                      height: size.height * 0.2,
                      width: size.width * 0.9,
                      child: SvgPicture.asset(
                        'assets/icons/Circles.svg',
                        fit: BoxFit.cover,
                      )),
                  AppBarWidget(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              height: size.height * 0.75,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0))),
              child: ControlPanelWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
