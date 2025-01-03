import 'package:flutter/material.dart';

class AnimatedPlayButton extends StatefulWidget {
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final bool isPlaying;

  const AnimatedPlayButton({
    super.key,
    required this.onPlay,
    required this.onPause,
    required this.isPlaying,
  });

  @override
  State<AnimatedPlayButton> createState() => _AnimatedPlayButtonState();
}

class _AnimatedPlayButtonState extends State<AnimatedPlayButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AnimatedPlayButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPlaying) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: widget.isPlaying
            ? [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 2,
                )
              ]
            : [],
      ),
      child: IconButton(
        onPressed: () {
          if (widget.isPlaying) {
            widget.onPause();
          } else {
            widget.onPlay();
          }
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          progress: _controller,
          size: 30,
        ),
      ),
    );
  }
}
