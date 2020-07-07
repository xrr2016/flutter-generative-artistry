import 'dart:math';
import 'package:flutter/material.dart';

class TiledLines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<BoxShadow> shadows = [];
    double opacity = 0.1;

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

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
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
                child: CustomPaint(
                  painter: TiledLinesPainter(20),
                ),
              ),
            ),
            SizedBox(height: 40),
            IconButton(icon: Icon(Icons.refresh), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class TiledLinesPainter extends CustomPainter {
  final double step;

  TiledLinesPainter(this.step);

  void _drawLine(
    Canvas canvas,
    double x,
    double y,
    double width,
    double height,
  ) {
    final bool isLeftToRight = Random().nextBool();

    final Paint paint = Paint()
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 2;

    Offset p1;
    Offset p2;

    if (isLeftToRight) {
      p1 = Offset(x, y);
      p2 = Offset(x + width, y + height);
    } else {
      p1 = Offset(x + width, y);
      p2 = Offset(x, y + height);
    }

    canvas.drawLine(p1, p2, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = 0; i < size.width; i += step) {
      for (double j = 0; j < size.height; j += step) {
        _drawLine(canvas, i, j, step, step);
      }
    }
  }

  @override
  bool shouldRepaint(TiledLinesPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TiledLinesPainter oldDelegate) => false;
}
