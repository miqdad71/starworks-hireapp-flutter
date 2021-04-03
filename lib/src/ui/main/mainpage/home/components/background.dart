import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starworks_hireapp_flutter/constants.dart';
import 'package:starworks_hireapp_flutter/src/ui/widget/listEngineer.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            height: 190,
            decoration: BoxDecoration(color: primaryColor),
            child: Center(
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login as ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Hai, ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.topCenter,
            child: ListEngineer(
              imageURL:
                  "https://statik.tempo.co/data/2019/09/06/id_870368/870368_720.jpg",
              name: "Miqdad",
              jobTitle: "Android Developer",
              location: "Pondok Gede, Bekasi",
            ),
          ),
        ),
      ],
    ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0);
    var controlPoint = Offset(size.width + 100, 250);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.height, size.width);
    path.lineTo(0, size.width);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
