import 'package:flutter/material.dart';
import 'package:starworks_hireapp_flutter/constants.dart';

class Project extends StatefulWidget {
  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          )
        ],
        automaticallyImplyLeading: false,
        title: Text('Project'),
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Project'),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
