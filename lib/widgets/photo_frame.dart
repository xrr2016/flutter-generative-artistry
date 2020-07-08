import 'package:flutter/material.dart';

class PhotoFrame extends StatelessWidget {
  final Widget child;

  const PhotoFrame({this.child});

  @override
  Widget build(BuildContext context) {
    double opacity = 0.1;
    List<BoxShadow> shadows = [];

    for (double i = 1; i <= 16; i++) {
      opacity -= 0.01;
      opacity = opacity > 0.01 ? opacity : 0.01;

      shadows.add(
        BoxShadow(
          offset: Offset(-i, i),
          color: Color.fromRGBO(0, 0, 0, opacity),
          blurRadius: 2,
          spreadRadius: 1,
        ),
      );
    }

    return Container(
      width: 320.0,
      height: 320.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 20.0,
        ),
        boxShadow: shadows,
      ),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20.0),
        child: child,
      ),
    );
  }
}
