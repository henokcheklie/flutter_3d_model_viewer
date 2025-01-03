import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:flutter_model_view/model_view_contollers/animation_controls.dart';
import 'package:flutter_model_view/model_view_contollers/model_animation_controller.dart';
import 'package:flutter_model_view/utility/constants.dart';
import 'package:flutter_model_view/utility/size_config.dart';

class Flutter3dController extends StatefulWidget {
  const Flutter3dController({super.key});

  @override
  Flutter3dControllerState createState() => Flutter3dControllerState();
}

class Flutter3dControllerState extends State<Flutter3dController>
    with SingleTickerProviderStateMixin {
  final Flutter3DController controller = Flutter3DController();
  late CameraController cameraController;
  late RotationAnimationController animationController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    cameraController = CameraController(controller: controller);
    animationController = RotationAnimationController(
      cameraController: cameraController,
    );
    animationController.initialize(this);

    controller.onModelLoaded.addListener(() {
      debugPrint('model is loaded : ${controller.onModelLoaded.value}');
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _handlePlayStateChanged(bool playing) {
    setState(() {
      _isPlaying = playing;
      if (playing) {
        animationController.play();
      } else {
        animationController.pause();
      }
    });
  }

  void _handleReset() {
    animationController.reset();
    setState(() => _isPlaying = false);
  }

  void _handleCameraOrbit() {
    cameraController.orbit(x: 45, y: 30, radius: 6);
  }

  void _handleCameraReset() {
    cameraController.reset();
  }

  void onRefresh() {
    super.initState();
    cameraController = CameraController(controller: controller);
    animationController = RotationAnimationController(
      cameraController: cameraController,
    );
    animationController.initialize(this);

    controller.onModelLoaded.addListener(() {
      debugPrint('model is loaded : ${controller.onModelLoaded.value}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AnimationControls(
        controller: controller,
        isPlaying: _isPlaying,
        onPlayStateChanged: _handlePlayStateChanged,
        onReset: _handleReset,
        onCameraOrbit: _handleCameraOrbit,
        onCameraReset: _handleCameraReset,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
            top: getProportionateScreenHeight(kDefaultPadding * 2)),
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
          height: MediaQuery.of(context).size.height * 0.4,
          child: Flutter3DViewer(
            activeGestureInterceptor: true,
            enableTouch: true,
            onProgress: (progressValue) {
              debugPrint('model loading progress : $progressValue');
            },
            onLoad: (modelAddress) {
              debugPrint('model loaded : $modelAddress');
            },
            onError: (error) {
              debugPrint('model failed to load : $error');
            },
            controller: controller,
            src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
          ),
        ),
      ),
    );
  }
}
