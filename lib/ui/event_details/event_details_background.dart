import 'package:flutter/material.dart';
import 'package:localeventsapp/model/event.dart';
import 'package:provider/provider.dart';

class EventDetailsBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final event = Provider.of<Event>(context);

    return Align(
      alignment: Alignment.topCenter,
      child: ClipPath(
        clipper: _ImageClipper(),
        child: Image.asset(
          event.imagePath,
          fit: BoxFit.cover,
          color: Color(0x99000000),
          colorBlendMode: BlendMode.darken,
          width: screenWidth,
          height: screenHeight * 0.5,
        ),
      ),
    );
  }
}

class _ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset curveStartingPoint = Offset(0, 40);
    Offset curveEndPoint = Offset(size.width, size.height * 0.95);
    return Path()
      ..lineTo(curveStartingPoint.dx, curveStartingPoint.dy - 5)
      ..quadraticBezierTo(size.width * 0.2, size.height * 0.85,
          curveEndPoint.dx - 60, curveEndPoint.dy + 10)
      ..quadraticBezierTo(size.width * 0.99, size.height * 0.99,
          curveEndPoint.dx, curveEndPoint.dy)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
