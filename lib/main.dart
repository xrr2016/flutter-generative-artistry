import 'package:flutter/material.dart';
import 'package:flutter_generative_artistry/graphs/triangular_mesh.dart';
import 'package:flutter_generative_artistry/models/particle.dart';
import 'package:flutter_generative_artistry/pages/triangular_mesh_page.dart';

import 'arts/particles2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Generative Artistry',
      home: Paticles2(),
    );
  }
}
