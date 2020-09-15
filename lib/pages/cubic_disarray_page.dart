import 'package:flutter/material.dart';
import 'package:flutter_generative_artistry/graphs/cubic_disarray.dart';

import '../widgets/photo_frame.dart';

class CubicDisarrayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoFrame(
          child: CubicDisarray(),
        ),
      ),
    );
  }
}
