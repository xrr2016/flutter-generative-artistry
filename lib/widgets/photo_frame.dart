import 'package:flutter/material.dart';

class PhotoFrame extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double padding;

  const PhotoFrame({
    this.child,
    this.width = 720.0,
    this.height = 720.0,
    this.padding = 20.0,
  });

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
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        boxShadow: shadows,
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 24.0),
      ),
      child: child,
    );
  }
}
