import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'animated_play_button.dart';

class AnimationControls extends StatelessWidget {
  final Flutter3DController controller;
  final bool isPlaying;
  final Function(bool) onPlayStateChanged;
  final VoidCallback onReset;
  final VoidCallback onCameraOrbit;
  final VoidCallback onCameraReset;

  const AnimationControls({
    super.key,
    required this.controller,
    required this.isPlaying,
    required this.onPlayStateChanged,
    required this.onReset,
    required this.onCameraOrbit,
    required this.onCameraReset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedPlayButton(
          onPlay: () => onPlayStateChanged(true),
          onPause: () => onPlayStateChanged(false),
          isPlaying: isPlaying,
        ),
        const SizedBox(height: 4),
        IconButton(
          onPressed: onReset,
          icon: const Icon(Icons.replay_circle_filled),
        ),
        const SizedBox(height: 4),
        IconButton(
          onPressed: onCameraOrbit,
          icon: const Icon(Icons.camera_alt),
        ),
        const SizedBox(height: 4),
        IconButton(
          onPressed: onCameraReset,
          icon: const Icon(Icons.cameraswitch_outlined),
        ),
      ],
    );
  }
}
