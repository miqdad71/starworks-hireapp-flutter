import 'package:flutter/material.dart';
import 'package:starworks_hireapp_flutter/constants.dart';

class Background extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: primaryColor
              ),
              child: Center(
                child: Text('Starworks',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 45
                ),),
              ),
            ),
          )
        ],
      )
    );
  }
}

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0);
    var controlPoint = Offset(size.width+100, 250);
    var endPoint = Offset(size.width/2, size.height);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.height, size.width);
    path.lineTo(0, size.width);

    /*var controlPoint = Offset(50, size.height);
    var endPoint = Offset(size.width/2, size.height);*/
    /*path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);*/
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}
