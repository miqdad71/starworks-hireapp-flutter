import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starworks_hireapp_flutter/src/ui/main/mainpage/home/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Home'),

                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
