import 'package:flutter/material.dart';
import 'package:flutter_generative_artistry/pages/joy_division_page.dart';
import 'pages/cubic_disarray_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Generative Artistry',
      home: JoyDivisionPage(),
    );
  }
}
