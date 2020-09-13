import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Point {
  final double x;
  final double y;

  Point({@required this.x, @required this.y});
}

class JoyDivision extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: JoyDivisionPainter(),
    );
  }
}

class JoyDivisionPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    double step = 10;
    List<List<Point>> lines = [];

    for (double i = step; i <= width - step; i += step) {
      List<Point> line = [];

      for (double j = step; j <= height - step; j += step) {
        double random = Random().nextDouble() * 10;
        Point point = Point(x: i, y: j + random);
        line.add(point);
      }
      lines.add(line);
    }

    Paint paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.black
      ..isAntiAlias = true;

    for (int i = 0; i < lines.length - 1; i++) {
      final List<Point> line = lines[i];

      for (int j = 0; j < line.length - 1; j++) {
        Point p1 = lines[i][j];
        Offset o1 = Offset(p1.x, p1.y);

        Point p2 = lines[i + 1][j + 1];
        Offset o2 = Offset(p2.x, p1.y);

        // print('p1: (${p1.x}, ${p1.y})');
        // print('p2: (${p2.x}, ${p2.y})');

        canvas.drawLine(o1, o2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(JoyDivisionPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(JoyDivisionPainter oldDelegate) => false;
}
