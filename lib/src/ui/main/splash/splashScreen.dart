import 'dart:async';

import 'package:flutter/material.dart';
import 'package:starworks_hireapp_flutter/constants.dart';
import '../onboard/onBoard.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/starworks_logo.png',
                width: 300,
                height: 250,
              ),
            ],
          ),
        ],
      ),
    );
  }

  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  navigationPage() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) => OnBoard(),
    ), (route) => false);
  }
}
