import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_generative_artistry/models/particle.dart';

Offset polarToCartesisn(double speed, double theta) {
  return Offset(speed * cos(theta), speed * sin(theta));
}

class Paticles2 extends StatefulWidget {
  @override
  _Paticles2State createState() => _Paticles2State();
}

class _Paticles2State extends State<Paticles2>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  List<Particle> particles = [];

  Random random = Random();

  Color getColor(Random random, double d, double alpha) {
    final a = 255;
    final r = (sin(d * 2 * pi) * 127.0 + 127.0).toInt();
    final g = (cos(d * 2 * pi) * 127.0 + 127.0).toInt();
    final b = random.nextInt(255);
    return Color.fromARGB(a, r, g, b);
  }

  void createBlodField() {
    final Size size = MediaQuery.of(context).size;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final int numOfBlod = 5;
    final double radius = size.width * .5 / numOfBlod;
    final double alpha = 0.2;

    blobField(radius, numOfBlod, alpha, center);
  }

  void blobField(double radius, int numOfBlod, double alpha, Offset center) {
    if (radius < 10) {
      return;
    }

    Particle p = Particle()
      ..theta = 0.0
      ..position = center
      ..origin = center
      ..radius = radius / 5
      ..color = getColor(random, pi, alpha);

    particles.add(p);

    var theta = 0.0;
    var dTheta = 2 * pi / numOfBlod;

    for (var i = 0; i < numOfBlod; i++) {
      final Offset pos = polarToCartesisn(radius, theta) + center;

      particles.add(
        Particle()
          ..theta = theta
          ..position = pos
          ..origin = center
          ..radius = radius / 3
          ..color = getColor(random, i.toDouble() / numOfBlod, alpha),
      );

      theta += dTheta;
      double f = 0.43;
      blobField(radius * f, numOfBlod, alpha * 1.5, pos);
    }
  }

  double t = 0;
  double dt = 0.01;
  double radiusFactor = 10;
  void updateBlobField() {
    t += dt;
    radiusFactor = mapRange(sin(t), -1, 1, 2, 10);
    particles.asMap().forEach(
      (key, p) {
        p.position = polarToCartesisn(
              p.radius * radiusFactor,
              p.theta + t,
            ) +
            p.origin;
      },
    );
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..forward();

    Tween(begin: 0, end: 10).animate(controller)
      ..addListener(() {
        if (particles.isEmpty) {
          createBlodField();
        } else {
          setState(() {
            updateBlobField();
          });
        }
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: ParticlesPainter(particles: particles),
        child: Column(
          children: [
            // SafeArea(
            //   child: Slider(
            //       value: radiusFactor,
            //       min: 1.0,
            //       max: 10.0,
            //       onChanged: (val) {
            //         setState(() {
            //           radiusFactor = val;
            //         });
            //       }),
            // )
          ],
        ),
      ),
    );
  }
}

double mapRange(
  double val,
  double min1,
  double max1,
  double min2,
  double max2,
) {
  double range1 = min1 - max1;
  double range2 = min2 - max2;
  return min2 + range2 * val / range1;
}

class ParticlesPainter extends CustomPainter {
  final List<Particle> particles;

  ParticlesPainter({
    @required this.particles,
  });

  @override
  void paint(Canvas canvas, Size size) {
    this.particles.asMap().forEach((key, Particle p) {
      Paint paint = Paint()
        ..color = p.color
        ..blendMode = BlendMode.modulate;
      canvas.drawCircle(p.position, p.radius, paint);
    });
  }

  @override
  bool shouldRepaint(ParticlesPainter oldDelegate) => true;
}
