import 'dart:math';

import 'package:flutter/material.dart';

class RecursiveMesh extends StatefulWidget {
  @override
  _RecursiveMeshState createState() => _RecursiveMeshState();
}

class _RecursiveMeshState extends State<RecursiveMesh>
    with SingleTickerProviderStateMixin {
  double _rotate = 0.0;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 100),
      vsync: this,
    );

    _controller.addListener(() {
      setState(() {
        _rotate += 0.02;
      });
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          size: Size(500, 500),
          painter: RecursiveMeshPainter(_rotate),
        ),
      ),
    );
  }
}

class RecursiveMeshPainter extends CustomPainter {
  final double rotate;

  RecursiveMeshPainter(this.rotate) : super();

  List<Rect> rects = [];
  int rectCounts = 100;
  double scale = 0.97;

  void _generateLines(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    for (var i = 0; i < rectCounts; i++) {
      Rect rect = Rect.fromCenter(
        center: center,
        width: size.width * scale,
        height: size.height * scale,
      );
      scale *= scale;
      rects.add(rect);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    _generateLines(canvas, size);

    Paint paint = Paint()
      ..strokeWidth = 1.0
      ..isAntiAlias = true
      ..color = Colors.amber
      ..style = PaintingStyle.stroke;

    canvas.rotate(rotate);

    rects.asMap().forEach((key, rect) {
      canvas.drawRect(rect, paint);
    });
  }

  @override
  bool shouldRepaint(RecursiveMeshPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(RecursiveMeshPainter oldDelegate) => false;
}
