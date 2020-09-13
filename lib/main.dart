import 'package:flutter/material.dart';
import 'package:flutter_generative_artistry/graphs/circle_packing.dart';
import 'package:flutter_generative_artistry/graphs/triangular_mesh.dart';
import 'package:flutter_generative_artistry/models/particle.dart';
import 'package:flutter_generative_artistry/pages/circle_packing_page.dart';
import 'package:flutter_generative_artistry/pages/joy_division_page.dart';
import 'package:flutter_generative_artistry/pages/piet_mondrian_page.dart';
import 'package:flutter_generative_artistry/pages/tiled_lines_page.dart';
import 'package:flutter_generative_artistry/pages/triangular_mesh_page.dart';

import 'arts/particles2.dart';
import 'arts/recursive_mesh.dart';
import 'pages/hypnotic_squares_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Generative Artistry',
      home: HypnoticSquaresPage(),
    );
  }
}
