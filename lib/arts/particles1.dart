import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_generative_artistry/models/particle.dart';

import '../colors.dart';

class Paticles1 extends StatefulWidget {
  @override
  _Paticles1State createState() => _Paticles1State();
}

class _Paticles1State extends State<Paticles1>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  List<Particle> particles;
  double maxRadius = 10;
  double maxSpeed = 0.2;
  double maxTheta = 2.0 * pi;

  Color getRandomColor() {
    int a = Random().nextInt(255);
    int r = Random().nextInt(255);
    int g = Random().nextInt(255);
    int b = Random().nextInt(105);

    return Color.fromARGB(a, r, g, b);
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
      ..forward();

    particles = List.generate(200, (int index) {
      return Particle()
        // ..color = getRandomColor()
        ..color = colors[Random().nextInt(colors.length)].withOpacity(.8)
        ..position = Offset(-1, -1)
        ..speed = Random().nextDouble() * maxSpeed
        ..radius = Random().nextDouble() * maxRadius
        ..theta = Random().nextDouble() * maxTheta;
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
      body: Center(
        child: CustomPaint(
          painter: ParticlesPainter(particles: particles),
          child: Container(),
        ),
      ),
    );
  }
}

class ParticlesPainter extends CustomPainter {
  final List<Particle> particles;

  ParticlesPainter({
    @required this.particles,
  });

  Offset polarToCartesisn(double speed, double theta) {
    return Offset(speed * cos(theta), speed * sin(theta));
  }

  @override
  void paint(Canvas canvas, Size size) {
    this.particles.asMap().forEach((int index, Particle particle) {
      Offset velocity = polarToCartesisn(particle.speed, particle.theta);
      double dx = particle.position.dx + velocity.dx;
      double dy = particle.position.dy + velocity.dy;

      if (particle.position.dx < 0 || particle.position.dx > size.width) {
        dx = Random().nextDouble() * size.width;
      }

      if (particle.position.dy < 0 || particle.position.dy > size.height) {
        dy = Random().nextDouble() * size.height;
      }
      particle.position = Offset(dx, dy);
    });

    this.particles.forEach((Particle particle) {
      Paint paint = Paint()
        ..color = particle.color
        ..isAntiAlias = true;

      canvas.drawCircle(particle.position, particle.radius, paint);
    });
  }

  @override
  bool shouldRepaint(ParticlesPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(ParticlesPainter oldDelegate) => false;
}
