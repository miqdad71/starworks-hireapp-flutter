import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    super.initState();
  }

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("", style: kBodyText);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              if(this.cusIcon.icon == Icons.search){
                this.cusIcon = Icon(Icons.cancel);
                this.cusSearchBar = TextField(
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: " Search here",
                    hintStyle: kBodyText
                  ),
                  style: kBodyText,
                );
              } else {
                  this.cusIcon = Icon(Icons.search);
                  this.cusSearchBar = Text("", style: kBodyText);
              }
            });
          },
          icon: cusIcon,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          )
        ],
        automaticallyImplyLeading: false,
        title: cusSearchBar,
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Search'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
