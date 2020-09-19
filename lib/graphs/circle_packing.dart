import 'dart:math';

import 'package:flutter/material.dart';

class Circle {
  Point center;
  double radius;
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
  // 生成的圆形数组
  List<Circle> circles = [];
  // 圆形的最小半径
  double minRaidus = 2;
  // 圆形的最大半径
  double maxRaidus = 100;
  // 圆形的总数
  int totalCircles = 500;
  // 尝试绘制圆形的总数
  int createCircleAttemps = 500;
  // 随机因子
  Random random = Random();

  void _createCircles(Canvas canvas, Size size) {
    Circle circle;
    bool circleSafeToDraw = false;

    for (var i = 0; i < createCircleAttemps; i++) {
      circle = Circle()
        ..radius = minRaidus
        ..center = Point(
          random.nextDouble() * size.width,
          random.nextDouble() * size.height,
        );

      if (_doesHaveACollision(circle, size)) {
        continue;
      } else {
        circleSafeToDraw = true;
        break;
      }
    }

    if (!circleSafeToDraw) {
      return;
    }

    for (var i = minRaidus; i < maxRaidus; i++) {
      circle.radius = i;
      if (_doesHaveACollision(circle, size)) {
        circle.radius--;
        break;
      }
    }

    circles.add(circle);
  }

  void _drawCircles(Canvas canvas) {
    Paint paint = Paint()
      ..strokeWidth = 0.5
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;

    circles.asMap().forEach((key, circle) {
      paint.color = Colors.black;
      Offset offset = Offset(circle.center.x, circle.center.y);
      canvas.drawCircle(offset, circle.radius, paint);
    });
  }

  bool _doesHaveACollision(Circle circle, Size size) {
    for (var i = 0; i < circles.length; i++) {
      Circle otherCircle = circles[i];
      double r2 = circle.radius + otherCircle.radius;

      if (r2 >= circle.center.distanceTo(otherCircle.center) - 1) {
        return true;
      }
    }

    if (circle.center.x + circle.radius >= size.width ||
        circle.center.x - circle.radius <= 0) {
      return true;
    }

    if (circle.center.y + circle.radius >= size.height ||
        circle.center.y - circle.radius <= 0) {
      return true;
    }

    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < totalCircles; i++) {
      _createCircles(canvas, size);
      _drawCircles(canvas);
    }
  }

  @override
  bool shouldRepaint(CirclePackingPainter oldDelegate) => true;
}
