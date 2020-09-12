import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_generative_artistry/colors.dart';

class Circle {
  Offset postion;
  double radius;
  Color color;
}

class CirclePacking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePackingPainter(),
    );
  }
}

class CirclePackingPainter extends CustomPainter {
  List<Circle> circles = [];
  double minRaidus = 2;
  double maxRaidus = 100;
  int totalCircles = 500;
  int createCircleAttemps = 500;

  void _createAndDrawCircle(Canvas canvas, Size size) {
    Random random = Random();
    Circle circle = Circle()
      ..postion = Offset(
        random.nextDouble() * size.width,
        random.nextDouble() * size.height,
      )
      ..radius = minRaidus
      ..color = colors[Random().nextInt(colors.length)];

    circles.add(circle);
    // Paint paint = Paint()
    //   ..color = circle.color
    //   ..strokeWidth = 1
    //   ..style = PaintingStyle.stroke;

    for (var i = minRaidus; i < maxRaidus; i++) {
      circle.radius = i;
      if (doesCircleHaveACollision(circle)) {
        circle.radius--;
        break;
      }
    }

    // canvas.drawCircle(circle.postion, circle.radius, paint);
  }

  bool doesCircleHaveACollision(Circle circle) {
    for (var i = 0; i < circles.length; i++) {
      Circle otherCircle = circles[i];
      double r2 = circle.radius + otherCircle.radius;
      double dx = circle.postion.dx - otherCircle.postion.dx;
      double dy = circle.postion.dy - otherCircle.postion.dy;

      print(r2);
      print(sqrt(pow(dx, 2) + pow(dy, 2)));

      if (r2 >= sqrt(pow(dx, 2) + pow(dy, 2))) {
        return true;
      }
    }
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < totalCircles; i++) {
      _createAndDrawCircle(canvas, size);
    }
  }

  @override
  bool shouldRepaint(CirclePackingPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CirclePackingPainter oldDelegate) => false;
}
