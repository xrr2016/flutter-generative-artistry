import 'package:flutter/material.dart';
import 'package:flutter_generative_artistry/graphs/piet_mondrian.dart';
import 'package:flutter_generative_artistry/widgets/photo_frame.dart';

class PietMonDrianPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoFrame(
          child: PietMondrian(),
        ),
      ),
    );
  }
}
