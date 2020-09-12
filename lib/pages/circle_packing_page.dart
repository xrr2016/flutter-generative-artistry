import 'package:flutter/material.dart';
import 'package:flutter_generative_artistry/graphs/circle_packing.dart';

import '../widgets/photo_frame.dart';

class CirclePackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoFrame(
          child: CirclePacking(),
        ),
      ),
    );
  }
}
