import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

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

    double step = 20;
    List<List<Point>> lines = [];

    for (double i = step; i <= width - step; i += step) {
      List<Point> line = [];
      for (double j = step; j <= width - step; j += step) {
        double distanceToCenter = (j - width / 2).abs();
        double variance = max(width / 2 - 50 - distanceToCenter, 0);
        double random = Random().nextDouble() * variance / 2 * -1;
        Point point = Point(j, i + random);

        line.add(point);
      }
      lines.add(line);
    }

    Paint paint = Paint()
      ..strokeWidth = 3
      ..color = Colors.black
      ..blendMode = BlendMode.dstOut
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;

    for (var i = 5; i < lines.length; i++) {
      Point p1 = lines[i][0];
      Path path = Path()..moveTo(p1.x, p1.y);

      for (var j = 0; j < lines[i].length - 2; j++) {
        double xc = (lines[i][j].x + lines[i][j + 1].x) / 2;
        double yc = (lines[i][j].y + lines[i][j + 1].y) / 2;

        Point p2 = lines[i][j];
        path.quadraticBezierTo(p2.x, p2.y, xc, yc);
        canvas.drawPath(path, paint);

        //   Path path2 = Path();
        //   Point p3 = lines[i + 1][j + 1];
        //   path.moveTo(p2.x, p2.y);
        //   path2.quadraticBezierTo(p2.x, p2.y, p3.x, p3.y);
        // canvas.drawPath(path2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(JoyDivisionPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(JoyDivisionPainter oldDelegate) => false;
}
