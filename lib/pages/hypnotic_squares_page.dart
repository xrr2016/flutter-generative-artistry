import 'package:flutter/material.dart';
import 'package:flutter_generative_artistry/graphs/hypnotic_squares.dart';
import 'package:flutter_generative_artistry/widgets/photo_frame.dart';

class HypnoticSquaresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoFrame(
          child: HypnoticSquares(),
        ),
      ),
    );
  }
}
