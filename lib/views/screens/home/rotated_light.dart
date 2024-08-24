// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shadat_pubg/views/config/assets_manager.dart';

typedef AsyncCallbackInt = Future<int> Function();

class RotatedLight extends StatefulWidget {
  final Color color;
  final double size;
  const RotatedLight({
    super.key,
    required this.color,
    this.size = 400,
  });

  @override
  State<RotatedLight> createState() => _RotatedLightState();
}

class _RotatedLightState extends State<RotatedLight>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int turns = 100000000;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5 * turns),
      upperBound: turns.toDouble(),
    )
      ..forward()
      ..addListener(() {
        if (_animationController.isCompleted) {
          _animationController.repeat();
        }
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: _animationController.value,
      duration: const Duration(seconds: 1),
      child: Image.asset(
        AssetsManager.getImage("light"),
        width: 400,
        fit: BoxFit.fitWidth,
        color: widget.color,
      ),
    );
  }
}
