import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListEngineer extends StatelessWidget {
  final String imageURL;
  final String name;
  final String jobTitle;
  final String location;

  final TextStyle textStyle = TextStyle(
      fontFamily: "Lato",
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.grey[800]);

  ListEngineer(
      {this.imageURL = "",
      this.name = "",
      this.jobTitle = "",
      this.location = ""});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: 400,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: Offset(1, 1))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                          image: DecorationImage(
                              image: NetworkImage(imageURL),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 16, top: 16),
                      child: Text(
                        name,
                        style: textStyle,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, top: 4),
                      child: Text(
                        jobTitle,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 16, top: 10),
                          child: Icon(
                            Icons.location_on_outlined,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 6),
                          child: Text(
                            location,
                            style: TextStyle(color: Colors.grey,
                                fontSize: 12),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ))
      ],
    );
  }
}
