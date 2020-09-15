import 'package:flutter/material.dart';
import 'package:flutter_generative_artistry/pages/circle_packing_page.dart';
import 'package:flutter_generative_artistry/pages/hypnotic_squares_page.dart';
import 'package:flutter_generative_artistry/pages/joy_division_page.dart';
import 'package:flutter_generative_artistry/pages/piet_mondrian_page.dart';
import 'package:flutter_generative_artistry/pages/un_deux_trois_page.dart';
import 'pages/cubic_disarray_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Generative Artistry',
      home: PietMonDrianPage(),
    );
  }
}
