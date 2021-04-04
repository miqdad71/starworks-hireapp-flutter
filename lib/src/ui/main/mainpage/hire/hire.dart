import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class Hire extends StatefulWidget {
  @override
  _HireState createState() => _HireState();
}

class _HireState extends State<Hire> {
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Hiring Project'),
        backgroundColor: primaryColor,

      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hire'),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
