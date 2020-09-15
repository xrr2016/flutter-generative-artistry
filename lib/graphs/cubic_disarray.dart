import 'dart:math';

import 'package:flutter/widgets.dart';

class CubicDisarray extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CubicDisarrayPainter(),
    );
  }
}

class CubicDisarrayPainter extends CustomPainter {
  void _draw(double width, double height, Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    Rect rect = Rect.fromLTWH(
      -width / 2,
      -height / 2,
      width,
      height,
    );
    canvas.drawRect(rect, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    double squareSize = 40.0;
    double randomDisplacement = 20.0;
    double rotateMultiplier = 20.0;
    double offset = 20.0;
    double canvasSize = size.width - offset;

    for (var i = squareSize; i <= canvasSize - squareSize; i += squareSize) {
      for (var j = squareSize; j <= canvasSize; j += squareSize) {
        double plusOrMinus = Random().nextBool() ? -1 : 1;
        double rotateAmt = j /
            canvasSize *
            pi /
            180 *
            plusOrMinus *
            Random().nextDouble() *
            rotateMultiplier;

        plusOrMinus = Random().nextBool() ? -1 : 1;
        var translateAmt = j /
            canvasSize *
            plusOrMinus *
            Random().nextDouble() *
            randomDisplacement;

        canvas.save();
        canvas.translate(i + translateAmt + offset, j);
        canvas.rotate(rotateAmt);
        _draw(squareSize, squareSize, canvas, size);
        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(CubicDisarrayPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CubicDisarrayPainter oldDelegate) => false;
}
