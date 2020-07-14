import 'package:flutter/material.dart';

import '../widgets/photo_frame.dart';
import '../graphs/triangular_mesh.dart';

class TriangularMeshPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoFrame(
          child: TriangularMesh(),
        ),
      ),
    );
  }
}
