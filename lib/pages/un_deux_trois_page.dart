import 'package:flutter/material.dart';
import 'package:flutter_generative_artistry/graphs/un_deux_trois.dart';
import 'package:flutter_generative_artistry/widgets/photo_frame.dart';

class UnDeuxTroisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoFrame(
          child: UnDeuxTrois(),
        ),
      ),
    );
  }
}
