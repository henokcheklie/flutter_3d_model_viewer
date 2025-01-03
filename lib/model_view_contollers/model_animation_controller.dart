import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class ModelAnimationController {
  final Flutter3DController controller;
  late AnimationController animationController;
  Animation<double>? horizontalRotationAnimation;
  Animation<double>? verticalRotationAnimation;

  ModelAnimationController({required this.controller});

  void initialize(TickerProvider vsync) {
    animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: vsync,
    );

    // Horizontal rotation (around Y-axis)
    horizontalRotationAnimation = Tween<double>(
      begin: 0,
      end: 360,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    ));

    // Vertical rotation (around X-axis)
    verticalRotationAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 20, end: 360),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: -20, end: 20),
        weight: 50,
      ),
    ]).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    ));

    // Combined animation listener
    animationController.addListener(() {
      controller.setCameraOrbit(
        horizontalRotationAnimation!.value, // X rotation
        verticalRotationAnimation!.value, // Y rotation
        5, // Radius
      );
    });
  }

  void play() {
    animationController.repeat();
  }

  void pause() {
    animationController.stop();
  }

  void reset() {
    animationController.reset();
    controller.resetCameraOrbit();
  }

  void dispose() {
    animationController.dispose();
  }
}

class CameraController {
  final Flutter3DController controller;
  double _currentX = 0;
  double _currentY = 20;
  double _currentRadius = 5;

  CameraController({required this.controller});

  void orbit({
    double? x,
    double? y,
    double? radius,
    bool animate = true,
  }) {
    _currentX = x ?? _currentX;
    _currentY = y ?? _currentY;
    _currentRadius = radius ?? _currentRadius;

    controller.setCameraOrbit(
      _currentX,
      _currentY,
      _currentRadius,
    );
  }

  void reset({bool animate = true}) {
    _currentX = 0;
    _currentY = 20;
    _currentRadius = 5;

    controller.resetCameraOrbit();
  }

  void rotateBy(double degrees) {
    _currentX = (_currentX + degrees) % 360;
    orbit(x: _currentX);
  }

  double get currentRotation => _currentX;
}

// RotationAnimationController
class RotationAnimationController {
  final CameraController cameraController;
  late AnimationController animationController;
  Animation<double>? rotationAnimation;

  RotationAnimationController({required this.cameraController});

  void initialize(TickerProvider vsync) {
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: vsync,
    );

    rotationAnimation = Tween<double>(
      begin: 0,
      end: 360,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ))
      ..addListener(_updateRotation);
  }

  void _updateRotation() {
    if (rotationAnimation != null) {
      cameraController.orbit(x: rotationAnimation!.value);
    }
  }

  void play() => animationController.repeat();
  void pause() => animationController.stop();

  void reset() {
    animationController.reset();
    cameraController.reset();
  }

  void dispose() {
    animationController.dispose();
  }
}
