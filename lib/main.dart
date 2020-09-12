import 'package:flutter/material.dart';
import 'package:flutter_generative_artistry/pages/circle_packing_page.dart';
import 'package:flutter_generative_artistry/pages/piet_mondrian_page.dart';

import 'arts/particles_page.dart';
import 'pages/triangular_mesh_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Generative Artistry',
      home: CirclePackingPage(),
    );
  }
}
