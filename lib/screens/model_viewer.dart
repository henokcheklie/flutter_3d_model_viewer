import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class Model3DViewer extends StatelessWidget {
  const Model3DViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.grey,
            gradient: RadialGradient(
              colors: [Color(0xffffffff), Colors.grey],
              stops: [0.1, 1.0],
              radius: 0.7,
              center: Alignment.center,
            ),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ModelViewer(
              src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',

              alt: "3d model",
              ar: true,
              autoRotate: true,
              cameraControls: true,
              disableZoom: false,
              autoPlay: true,
              poster: "assets/3d.png",
              iosSrc:
                  'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
              shadowIntensity: 1,

              // backgroundColor:const Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
            ),
          )),
    );
  }
}
