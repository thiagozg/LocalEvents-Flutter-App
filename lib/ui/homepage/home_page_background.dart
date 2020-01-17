import 'package:flutter/material.dart';

class HomePageBackground extends StatelessWidget {
  final screenHeigth;

  const HomePageBackground({Key key, @required this.screenHeigth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return ClipPath(
      clipper: _BottomShapeClipper(),
      child: Container(
        height: screenHeigth * 0.5,
        color: themeData.primaryColor,
      ),
    );
  }
}

class _BottomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset curveStartPoint = Offset(0, size.height * 0.85);
    Offset curveEndPoint = Offset(size.width, size.height * 0.85);
    return Path()
      ..lineTo(curveStartPoint.dx, curveStartPoint.dy)
      ..quadraticBezierTo(
          size.width / 2, size.height, curveEndPoint.dx, curveEndPoint.dy)
      ..lineTo(size.width, 0);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
