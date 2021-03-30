import 'package:flutter/material.dart';
import 'package:starworks_hireapp_flutter/constants.dart';

class Background extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/main_background.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(primaryColor.withOpacity(0.9), BlendMode.hardLight)
          )
        ),
    );
  }
}
